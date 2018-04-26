<?php

namespace App;

use App\Mail\Hello;
use App\Query\DeckQueryBuilder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Validator;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Illuminate\Support\Facades\Mail;

class Deck extends Model
{
    public static $temporada;

    protected $rules = [
        'user_id' => 'required',
        'modo_id' => 'required',
        'nome' => 'required',
        'custo' => 'required',
    ];

    // TODO no frontend são carregados includes para verificar algumas situações. Portanto, o objeto que chega ao backend vem com "lixo"
    // TODO usar fillable?
    protected $guarded = [
        'modo',
        'temporadas'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function modo()
    {
        return $this->belongsTo('App\Modo');
    }

    public function dificuldade()
    {
        return $this->belongsTo('App\Dificuldade');
    }

    public function matchup()
    {
        return $this->belongsTo('App\Matchup');
    }

    public function cartas()
    {
        return $this->belongsToMany('App\Carta')->withPivot('total');
    }

    public function temporadas()
    {
        return $this->belongsToMany('App\Temporada')->withPivot('winrate', 'vitorias', 'derrotas');
    }

    public function partidas()
    {
        return $this->hasMany('App\Partida');
    }

    public static function listar(array $params = [])
    {
        $decks = (new DeckQueryBuilder(new Deck(), $params))->build()->paginate();

        Deck::$temporada = array_get($params, 'temporada');
        collect($decks->items())->each->calc_temporada();

        return $decks;
    }

    public static function get($id, array $params = [])
    {
        // sleep(2);
        $params['id'] = $id;
        $deck = (new DeckQueryBuilder(new Deck(), $params))->build()->get();

        Deck::$temporada = array_get($params, 'temporada');
        $deck->calc_temporada();

        return $deck;
    }

    public function criar()
    {
        $user = Auth::user();
        $this->user_id = $user->id;

        $cartas = (object) $this->cartas;
        $matchup = (object) $this->matchup;

        unset($this->cartas, $this->matchup);

        try {
            DB::beginTransaction();

            $cartas = Carta::build($cartas);
            $matchup->cores = Carta::extrairCores($cartas);

            $m = Matchup::build($matchup);
            $user->can('create', [$m, $this->modo->chave]);
            $m->save();

            $this->matchup_id = $m->id;

            $user->can('create', $this);
            $user->can('create_cartas', [$this, $cartas]);

            $this->save();

            $this->cartas()->detach();
            foreach ($cartas as $carta) {
                $this->cartas()->attach($carta->id, ['total' => $carta->totalx]);
            }

            DB::commit();
        } catch (\PDOException $e) {
            DB::rollback();
            throw $e;
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }

        return $this;
    }

    public function excluir()
    {
        $user = Auth::user();
        $deck = $this;
        $user->can('delete', $this);

        try {
            DB::beginTransaction();

            $this->partidas()->delete();

            $temporadas = $deck->temporadas;
            foreach ($temporadas as $temporada) {
                $temporada->vitorias = $temporada->partidas()->where('evento', 1)->count();
                $temporada->derrotas = $temporada->partidas()->where('evento', -1)->count();
                $temporada->winrate = Calculador::winrate($temporada->vitorias, $temporada->derrotas);
                $temporada->save();
            }

            $this->temporadas()->detach();
            $this->cartas()->detach();
            $this->delete();

            DB::commit();
        } catch (\PDOException $e) {
            DB::rollback();
            throw $e;
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }

        return $deck;
    }

    public function atualizar()
    {
        $user = Auth::user();
        $deck = $this;

        $user->can('update', $this);

        return self::criar();
    }

    public function getPartidasRecentesAttribute()
    {
        return $this->partidas()->temporada($this)->oldest()->limit(15)->get();
    }

    public function getPartidasAttribute()
    {
        return $this->partidas()->with('matchup', 'matchup.cores', 'matchup.tipos', 'matchup.arquetipo')->temporada($this)->get();
    }

    public function getTotalPartidasAttribute()
    {
        return $this->vitorias + $this->derrotas;
    }

    public function getEstatisticasAttribute()
    {
        $distribuicao = $this->distribuicao();
        $progresso = $this->progresso();
        $desempenho = $this->desempenho();

        return [
          'distribuicao' => $distribuicao,
          'progresso' => $progresso,
          // 'desempenho' => ['bom_contra' => [], 'ruim_contra' => []],
          'desempenho' => $desempenho
      ];
    }

    public function desempenho()
    {
        $bom_contra = [];
        $ruim_contra = [];

        // pegando matchup com no mínimo 5 partidas (CORES + ARQUETIPOS)
        $matchups = Matchup::select(
                              DB::raw("SUBSTRING_INDEX(hash, '#', 1) as arquetipo"),
                              DB::raw("SUBSTRING_INDEX(SUBSTRING_INDEX(hash, '#', 2), '#', '-1') as cores"),
                              DB::raw('round((sum(partidas.evento = 1) / count(partidas.evento)) * 100)  as winrate'),
                              DB::raw('sum(partidas.evento = 1)  as vitorias'),
                              DB::raw('sum(partidas.evento = -1) as derrotas')
                              )
                              ->join('partidas', 'partidas.matchup_id', '=', 'matchups.id')
                              ->where('deck_id', $this->id)
                              ->groupBy('arquetipo')
                              ->groupBy('cores')
                              ->havingRaw('(vitorias + derrotas) >= 5') // TODO aumentar depois
                              ->get();

        $matchups = $matchups->map(function ($item) {
            $cores = explode(',', $item->cores);
            return (object)[
                'winrate' => (int) $item->winrate,
                'derrotas' => (int) $item->derrotas,
                'vitorias' => (int) $item->vitorias,
                'arquetipo' => Arquetipo::where('id', $item->arquetipo)->first(),
                'cores' => Cor::whereIn('id', $cores)->get()
            ];
        });

        // pegando matchup com no mínimo 5 partidas (CORES + TIPOS)
        $matchups2 = Matchup::select(
                              DB::raw("SUBSTRING_INDEX(hash,'#',-1) as tipos"),
                              DB::raw("SUBSTRING_INDEX(SUBSTRING_INDEX(hash, '#', 2), '#', '-1') as cores"),
                              DB::raw('round((sum(partidas.evento = 1) / count(partidas.evento)) * 100)  as winrate'),
                              DB::raw('sum(partidas.evento = 1)  as vitorias'),
                              DB::raw('sum(partidas.evento = -1) as derrotas')
                              )
                              ->join('partidas', 'partidas.matchup_id', '=', 'matchups.id')
                              ->where('deck_id', $this->id)
                              ->groupBy('tipos')
                              ->groupBy('cores')
                              ->havingRaw('(vitorias + derrotas) >= 5 AND tipos > 0') // TODO aumentar depois
                              ->get();

        $matchups2 = $matchups2->map(function ($item) {
            $cores = explode(',', $item->cores);
            $tipos = explode(',', $item->tipos);

            return (object)[
                'winrate' => (int) $item->winrate,
                'derrotas' => (int) $item->derrotas,
                'vitorias' => (int) $item->vitorias,
                'tipos' => Tipo::whereIn('id', $tipos)->get(),
                'cores' => Cor::whereIn('id', $cores)->get()
            ];
        });

        $matchups = ($matchups->count() > 0) ? $matchups->merge($matchups2) : $matchups2;

        // pegando matchup com no mínimo 5 partidas (CORES + TIPOS + ARQUETIPOS)
        $matchups3 = Matchup::select(
                              DB::raw("SUBSTRING_INDEX(hash, '#', 1) as arquetipo"),
                              DB::raw("SUBSTRING_INDEX(hash,'#',-1) as tipos"),
                              DB::raw("SUBSTRING_INDEX(SUBSTRING_INDEX(hash, '#', 2), '#', '-1') as cores"),
                              DB::raw('round((sum(partidas.evento = 1) / count(partidas.evento)) * 100)  as winrate'),
                              DB::raw('sum(partidas.evento = 1)  as vitorias'),
                              DB::raw('sum(partidas.evento = -1) as derrotas')
                              )
                              ->join('partidas', 'partidas.matchup_id', '=', 'matchups.id')
                              ->where('deck_id', $this->id)
                              ->groupBy('tipos')
                              ->groupBy('cores')
                              ->groupBy('arquetipo')
                              ->havingRaw('(vitorias + derrotas) >= 5 AND tipos > 0') // TODO aumentar depois
                              ->get();

        $matchups3 = $matchups3->map(function ($item) {
            $cores = explode(',', $item->cores);
            $tipos = explode(',', $item->tipos);

            return (object)[
                'winrate' => (int) $item->winrate,
                'derrotas' => (int) $item->derrotas,
                'vitorias' => (int) $item->vitorias,
                'tipos' => Tipo::whereIn('id', $tipos)->get(),
                'cores' => Cor::whereIn('id', $cores)->get(),
                'arquetipo' => Arquetipo::where('id', $item->arquetipo)->first()
            ];
        });

        $matchups = $matchups->merge($matchups3);
        // dd($matchups);

        foreach ($matchups as $matchup) {
            if ($matchup->winrate >= 66) {
                $bom_contra[] = $matchup;
            } elseif ($matchup->winrate <= 40) {
                $ruim_contra[] = $matchup;
            }
        }

        return [
            'bom_contra' => $bom_contra,
            'ruim_contra' => $ruim_contra
        ];
    }

    public function progresso()
    {
        // TODO ver diference de ->partidas e ->partidas() um deles inclui a collecao no objeto retornado, sem ser pedido.
        $progressos = $this->partidas()->temporada($this)->orderBy('id')->pluck('evento');

        return Calculador::progresso($progressos);
    }

    public function distribuicao()
    {
        // TODO não deveria incluir cartas no retorno do JSON geral
        $cartas = $this->cartas;

        $terrenos = [];
        $faerias = [
            1 => 0,
            2 => 0,
            3 => 0,
            4 => 0,
            5 => 0,
            6 => 0,
            7 => 0,
            0 => 0
        ];

        foreach ($cartas as $carta) {
            // TERRENOS
            $cores = Carta::extrairTotais($carta);

            foreach ($cores as $cor) {
                $k = key($cor);
                $v = $cor[$k];

                if (isset($terrenos[$k])) {
                    $terrenos[$k] += $v;
                } else {
                    $terrenos[$k] = $v;
                }
            }

            // FAERIAS
            $f = ($carta->metadata->faeria >= 7) ? 7 : $carta->metadata->faeria;
            $faerias[$f] += $carta->total;
        }

        $tipos = $this->cartas->pluck('metadata.card_type')->toArray();
        $tipos = array_count_values($tipos);

        return [
            'faerias' => $faerias,
            'terrenos' => $terrenos,
            'tipos' => $tipos
        ];
    }

    public function calc_temporada()
    {
        $periodo = Deck::$temporada;

        if ($periodo == 'todas') {
            $derrotas = $this->derrotas;
            $vitorias = $this->vitorias;
        } elseif ($periodo == 'anterior') {
            $t = $this->temporadas->where('aberta', 0)->sortByDesc('id')->first();

            if ($t == null) {
                $vitorias = 0;
                $derrotas = 0;
            } else {
                $vitorias = $t->pivot->vitorias;
                $derrotas = $t->pivot->derrotas;
            }
        } else {
            $t = $this->temporadas->where('aberta', 1)->first();

            if ($t == null) {
                $vitorias = 0;
                $derrotas = 0;
            } else {
                $vitorias = $t->pivot->vitorias;
                $derrotas = $t->pivot->derrotas;
            }
        }

        $this->vitorias = $vitorias;
        $this->derrotas = $derrotas;
        $this->winrate = Calculador::winrate($this->vitorias, $this->derrotas);
    }

    public static function importar($url)
    {
        $validation = Validator::make(['url' => $url], ['url' => 'required|url']);

        if ($validation->fails()) {
            throw new BadRequestHttpException(__('O endereço informado é inválido'));
        }

        $lista = [];
        try {
            $parser = new \HtmlDomParser();
            $html = $parser->fileGetHtml($url);
            $decklists = $html->find('.deckList li');
            foreach ($decklists as $list) {
                $lista[] = ['id' => (int) trim($list->getAttribute('data-card-preview')), 'total' => (int) trim($list->find('.deckCard__number', 0)->plaintext)];
            }
        } catch (\Exception $e) {
            throw new BadRequestHttpException(__('Não foi possível importar o deck'));
        }

        return $lista;
    }
}

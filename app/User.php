<?php

namespace App;

use Illuminate\Support\Facades\DB;
use App\Query\UserQueryBuilder;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Unlu\Laravel\Api\QueryBuilder;

class User extends Authenticatable implements JWTSubject
{
    use Notifiable;

    public static $temporada;

    protected $rules = [
        'username' =>  'required|alpha_dash|unique:users,username|regex:/^[A-Za-z0-9_-]+$/u',
        'email' => 'required|email|unique:users,email',
        'password' => 'required|min:4',
    ];


    protected $fillable = [
        'nome', 'username', 'email', 'password', 'locale'
    ];


    protected $hidden = [
        'password', 'remember_token',
    ];

    public function decks()
    {
        return $this->hasMany('App\Deck');
    }

    public function temporadas()
    {
        return $this->hasMany('App\Temporada');
    }

    public function partidas()
    {
        return $this->hasManyThrough('App\Partida', 'App\Deck');
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    public function getRules()
    {
        return $this->rules;
    }

    public static function listar(array $params = [])
    {
        $users = (new UserQueryBuilder(new User(), $params))->build()->paginate();

        User::$temporada = array_get($params, 'temporada');
        collect($users->items())->each->calc_temporada();

        return $users;
    }

    public static function get($id, array $params = [])
    {
        $params['id'] = $id;
        $user = (new QueryBuilder(new User(), $params))->build()->get();

        User::$temporada = array_get($params, 'temporada');
        $user->calc_temporada();

        return $user;
    }

    public function estatisticaPandora()
    {
        $partidas = $this->partidas()->temporada($this)->with('deck')
        ->whereHas('deck.modo', function ($q) {
            return $q->where('chave', 'PANDORA');
        })
        ->get();

        // dd($partidas->pluck('deck_id', 'evento'));

        $progressos = $partidas->pluck('evento');
        $progresso = Calculador::progresso($progressos);

        $vitorias = $partidas->where('evento', 1)->pluck('evento')->count();
        $derrotas = $partidas->where('evento', -1)->pluck('evento')->count();
        $winrate = Calculador::winrate($vitorias, $derrotas);

        $pandora['vitorias'] = $vitorias;
        $pandora['derrotas'] = $derrotas;
        $pandora['winrate'] = $winrate;
        $pandora['progresso'] = $progresso;

        return $pandora;
    }

    public function estatisticaBatalha()
    {
        $partidas = $this->partidas()->temporada($this)->with('deck')
        ->whereHas('deck.modo', function ($q) {
            return $q->where('chave', 'BATALHA');
        })
        ->get();

        $progressos = $partidas->pluck('evento');
        $progresso = Calculador::progresso($progressos);

        $vitorias = $partidas->where('evento', 1)->pluck('evento')->count();
        $derrotas = $partidas->where('evento', -1)->pluck('evento')->count();
        $winrate = Calculador::winrate($vitorias, $derrotas);

        $batalha['vitorias'] = $vitorias;
        $batalha['derrotas'] = $derrotas;
        $batalha['winrate'] = $winrate;
        $batalha['progresso'] = $progresso;

        return $batalha;
    }

    public function getEstatisticasAttribute()
    {
        $pandora = (object) $this->estatisticaPandora();
        $batalha = (object) $this->estatisticaBatalha();

        return [
          'pandora' => $pandora,
          'batalha' => $batalha
        ];
    }

    public function atualizar()
    {
        $this->save();
        return $this;
    }

    public function calc_temporada()
    {
        $periodo = User::$temporada;

        if ($periodo == 'todas') {
            $derrotas = $this->derrotas;
            $vitorias = $this->vitorias;
        } elseif ($periodo == 'anterior') {
            $t = $this->temporadas->where('aberta', 0)->sortByDesc('id')->first();

            if ($t == null) {
                $vitorias = 0;
                $derrotas = 0;
            } else {
                $vitorias = $t->vitorias;
                $derrotas = $t->derrotas;
            }
        } else {
            $t = $this->temporadas->where('aberta', 1)->first();

            if ($t == null) {
                $vitorias = 0;
                $derrotas = 0;
            } else {
                $vitorias = $t->vitorias;
                $derrotas = $t->derrotas;
            }
        }

        $this->vitorias = $vitorias;
        $this->derrotas = $derrotas;
        $this->winrate = Calculador::winrate($this->vitorias, $this->derrotas);
    }

    //TODO não está sendo usado por enquanto
    public static function topModo($chave, $limit = 10)
    {
        return [];

        return User::select('users.username',
                            DB::raw('round((sum(decks.vitorias)/(sum(decks.vitorias) + sum(decks.derrotas))) * 100) as winrate'),
                            DB::raw('sum(decks.vitorias) as vitorias'),
                            DB::raw('sum(decks.derrotas) as derrotas'))
                  ->join('decks', 'decks.user_id', '=', 'users.id')
                  ->join('modos', 'modos.id', '=', 'decks.modo_id')
                  ->where('modos.chave', $chave)
                  ->where(DB::raw('users.vitorias + users.derrotas'), '>=', 40)
                  ->orderBy('winrate', 'DESC')
                  ->groupBy('users.username')
                  ->get();
    }
}

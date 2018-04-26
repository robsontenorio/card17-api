<?php

namespace App;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Unlu\Laravel\Api\QueryBuilder;

class Partida extends Model
{
    protected $rules = [
      'deck_id' =>  'required',
      'matchup_id' => 'required',
      'evento' => 'required',
      'primeiro' => 'required'
  ];

    protected $attributes = [
    'evento' => 'resultado'
  ];

    public function deck()
    {
        return $this->belongsTo('App\Deck');
    }

    public function matchup()
    {
        return $this->belongsTo('App\Matchup');
    }

    public function temporada()
    {
        return $this->belongsTo('App\Temporada');
    }


    public function scopeTemporada($query, $user)
    {
        $q = $query;
        if ($user::$temporada == 'todas') {
            $q = $query;
        } else {
            $t = $user->temporadas()->periodo($user::$temporada)->first();
            $q = ($t == null) ? $query->where('temporada_id', 0) : $query->where('temporada_id', $t->id);
        }

        return $q;
    }

    public static function get($id, array $params = [])
    {
        $params['id'] = $id;
        $deck = (new QueryBuilder(new Partida(), $params))->build()->get();


        return $deck;
    }

    public function criar()
    {
        $user = Auth::user();
        $deck = Deck::find($this->deck_id);

        $user->can('create', [$this, $deck]);

        // ajustando variaveis
        $this->deck->user_id = $user->id;
        $this->evento = ($this->evento == '0') ? -1 : $this->evento;

        $matchup = (object) $this->matchup;
        unset($this->matchup);

        try {
            DB::beginTransaction();

            $m = Matchup::build($matchup);
            $user->can('create', [$m, $deck->modo->chave]);
            $m->save();

            $this->matchup_id = $m->id;
            $this->save();

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
        $partida = $this;

        $user->can('delete', $this);

        try {
            DB::beginTransaction();
            
            $this->delete();

            DB::commit();
        } catch (\PDOException $e) {
            DB::rollback();
            throw $e;
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }

        return $partida;
    }
}

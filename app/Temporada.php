<?php

namespace App;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Temporada extends Model
{
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function partidas()
    {
        return $this->hasMany('App\Partida');
    }

    public function decks()
    {
        return $this->belongsToMany('App\Deck')->withPivot('winrate', 'vitorias', 'derrotas');
    }

    public function scopePeriodo($query, $periodo)
    {
        $q = $query;
        if ($periodo == 'todos') {
            $q = $query;
        } elseif ($periodo == 'anterior') {
            $q = $query->where('aberta', 0)->latest('id');
        } else {
            $q = $query->where('aberta', 1);
        }

        return $q;
    }

    public static function encerrar($nome_temporada)
    {
        $user = Auth::user();

        $temporada_aberta = $user->temporadas()->where('aberta', 1)->first();
        $temporada_aberta->aberta = 0;
        $temporada_aberta->save();

        $temporada = Temporada::make(['nome' => 'Temporada nova']);
        $temporada->user_id = $user->id;
        $temporada->nome = $nome_temporada;
        $temporada->aberta = 1;
        $temporada->save();

        return $temporada;
    }

    public function excluir()
    {
        $user = Auth::user();
        $temporada = $this;

        $user->can('delete', $this);

        try {
            DB::beginTransaction();

            // determinando a temporada reaberta
            $temporada_reaberta = $user->temporadas()->where('aberta', 0)->latest()->first();
            $temporada_reaberta->aberta = 1;
            $temporada_reaberta->save();

            $decks = $this->decks;

            foreach ($decks as $deck) {
                $deck->vitorias = $deck->partidas()->where('evento', 1)->where('temporada_id', '<>', $this->id)->count();
                $deck->derrotas = $deck->partidas()->where('evento', -1)->where('temporada_id', '<>', $this->id)->count();
                $deck->winrate = Calculador::winrate($deck->vitorias, $deck->derrotas);
                $deck->save();
            }

            $this->decks()->detach();
            $this->partidas()->delete();
            $this->delete();

            DB::commit();
        } catch (\PDOException $e) {
            DB::rollback();
            throw $e;
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }

        return $temporada;
    }
}

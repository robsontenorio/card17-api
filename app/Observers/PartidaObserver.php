<?php

namespace App\Observers;

use App\Deck;
use App\Partida;
use App\Temporada;
use App\Calculador;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

class PartidaObserver
{
    public function saving(Partida $partida)
    {
        $deck = $partida->deck;
        $user = $partida->deck->user;

        $temporada = $user->temporadas()->where('aberta', 1)->first();
        $partida->temporada_id = $temporada->id;
    }

    public function saved(Partida $partida)
    {
        $deck = $partida->deck;
        $user = $partida->deck->user;

        // DEFININDO TEMPORADA ATUAL DO USARIO
        $temporada = $user->temporadas()->where('aberta', 1)->first();
        $temporada_deck = $temporada->decks()->wherePivot('deck_id', $deck->id)->first();

        if ($temporada_deck == null) {
            $temporada->decks()->attach($deck->id);
            $temporada_deck = Temporada::make(['vitorias' => 0 , 'derrotas' => 0, 'winrate' => 0]);
        } else {
            $temporada_deck = $temporada_deck->pivot;
        }


        // CALCULANDO PONTUACOES
        if ($partida->evento == 1) {
            $user->vitorias++;
            $deck->vitorias++;
            $temporada->vitorias++;
            $temporada_deck->vitorias++;
        } else {
            $user->derrotas++;
            $deck->derrotas++;
            $temporada->derrotas++;
            $temporada_deck->derrotas++;
        }

        $user->winrate = Calculador::winrate($user->vitorias, $user->derrotas);
        $deck->winrate = Calculador::winrate($deck->vitorias, $deck->derrotas);
        $temporada->winrate = Calculador::winrate($temporada->vitorias, $temporada->derrotas);
        $temporada_deck->winrate = Calculador::winrate($temporada_deck->vitorias, $temporada_deck->derrotas);

        $user->save();
        $deck->save();
        $temporada->save();
        $temporada->decks()->syncWithoutDetaching([
                            $deck->id => [
                              'winrate' => $temporada_deck->winrate,
                              'vitorias' => $temporada_deck->vitorias,
                              'derrotas' => $temporada_deck->derrotas]
                          ]);
    }

    public function deleted(Partida $partida)
    {
        $deck = $partida->deck;
        $temporada = $partida->temporada;
        $user = $deck->user;
        $deck_temporada = $deck->temporadas()->wherePivot('temporada_id', $temporada->id)->first()->pivot;

        if ($partida->evento == 1) {
            $deck->vitorias--;
            $temporada->vitorias--;
            $user->vitorias--;
            $deck_temporada->vitorias--;
        } else {
            $deck->derrotas--;
            $temporada->derrotas--;
            $user->derrotas--;
            $deck_temporada->derrotas--;
        }

        $deck->winrate = Calculador::winrate($deck->vitorias, $deck->derrotas);
        $user->winrate = Calculador::winrate($user->vitorias, $user->derrotas);
        $temporada->winrate = Calculador::winrate($temporada->vitorias, $temporada->derrotas);
        $deck_temporada->winrate = Calculador::winrate($deck_temporada->vitorias, $deck_temporada->derrotas);

        $deck->save();
        $user->save();
        $temporada->save();
        $temporada->decks()->syncWithoutDetaching([
                            $deck->id => [
                              'winrate' => $deck_temporada->winrate,
                              'vitorias' => $deck_temporada->vitorias,
                              'derrotas' => $deck_temporada->derrotas]
                          ]);
    }
}

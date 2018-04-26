<?php

namespace App\Observers;

use App\Deck;
use App\Calculador;

class DeckObserver
{
    public function deleted(Deck $deck)
    {
        $user = $deck->user;

        $user->vitorias = $user->temporadas()->pluck('vitorias')->sum();
        $user->derrotas = $user->temporadas()->pluck('derrotas')->sum();
        $user->winrate = Calculador::winrate($user->vitorias, $user->derrotas);
        $user->save();
    }
}

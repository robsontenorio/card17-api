<?php

namespace App\Observers;

use App\User;
use App\Temporada;
use App\Calculador;

class TemporadaObserver
{
    public function deleted(Temporada $temporada)
    {
        $user = $temporada->user;
        $user->vitorias = $user->temporadas()->pluck('vitorias')->sum();
        $user->derrotas = $user->temporadas()->pluck('derrotas')->sum();
        $user->winrate = Calculador::winrate($user->vitorias, $user->derrotas);
        $user->save();
    }
}

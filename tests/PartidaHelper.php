<?php

namespace Tests;

use App;
use App\Cor;
use App\Tipo;
use App\Partida;
use App\Arquetipo;

class PartidaHelper
{
    public static function format(Partida $partida)
    {
        $cores = $partida->matchup->cores->pluck('id')->toArray();
        $tipos = $partida->matchup->tipos->pluck('id')->toArray();
        $arquetipo_id = $partida->matchup->arquetipo_id;

        unset($partida->matchup);
        unset($partida->matchup_id);

        $partida->matchup = (object) [
            'cores' => $cores,
            'tipos' => $tipos,
            'arquetipo_id' => $arquetipo_id
        ];

        return $partida;
    }
}

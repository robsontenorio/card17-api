<?php

namespace Tests;

use App\Deck;
use Illuminate\Database\Eloquent\Collection;

class DeckHelper
{
    public static function build($deck, $estado)
    {
        $deck->cartas = CartaHelper::build($estado);

        return self::format($deck);
    }


    public static function format(Deck $deck)
    {
        $deck->cartas  =  CartaHelper::toJson($deck->cartas);

        $tipos = $deck->matchup->tipos->pluck('id')->toArray();
        $arquetipo_id = $deck->matchup->arquetipo_id;

        unset($deck->matchup);
        unset($deck->matchup_id);

        $deck->matchup = (object) [
            'tipos' => $tipos,
            'arquetipo_id' => $arquetipo_id
        ];

        return $deck;
    }
}

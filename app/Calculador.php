<?php

namespace App;

class Calculador
{
    public static function winrate($vitorias, $derrotas)
    {
        $winrate =  ($vitorias || $derrotas) ?   $vitorias / ($vitorias + $derrotas) * 100 : 0;
        $winrate = round($winrate);

        return $winrate;
    }

    public static function progresso($progressos)
    {
        $progresso = [];

        foreach ($progressos as $k => $v) {
            if ($k == 0) {
                $progresso[] = $v;
            } else {
                $progresso[] = $progresso[$k - 1] + $v;
            }
        }
        return $progresso;
    }
}

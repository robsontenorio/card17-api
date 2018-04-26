<?php

namespace Tests;

use App;
use App\Cor;
use App\Tipo;
use App\Arquetipo;

class MatchupHelper
{
    public static function build($modo, $com_arquetipos = true, $com_cores = true, $max_cores = 3)
    {
        $m = factory(App\Matchup::class)->create([
                'arquetipo_id' => Arquetipo::inRandomOrder()->first()->id
            ]);

        if ($modo == 'batalha') {
            $cores = Cor::inRandomOrder()->where('chave', '<>', 'PANDORA')->take(rand(1, 4))->pluck('id')->toArray();
        } else {
            $pandora = Cor::inRandomOrder()->where('chave', '=', 'PANDORA')->get();
            $take_cores = ($max_cores > 3) ? $max_cores : rand(1, 3);
            $cores = Cor::inRandomOrder()->whereNotIn('chave', ['PANDORA', 'HUMAN'])->take($take_cores)->get();
            $cores = $cores->merge($pandora)->pluck('id')->toArray();
        }


        if ($com_cores) {
            $m->cores()->attach($cores);
        }

        $m->tipos()->attach(Tipo::inRandomOrder()->take(1)->pluck('id')->toArray());

        return $m;
    }
}

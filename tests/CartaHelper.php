<?php

namespace Tests;

use App;
use App\Cor;
use App\Tipo;
use App\Partida;
use App\Arquetipo;

class CartaHelper
{
    public static function build($estado)
    {
        return self::$estado();
    }

    public static function select_batalha($cartas, $max_cartas = 30, $max_amostras = 3, $max_lendarias = 1)
    {
        $selecionadas = [];
        $cartas_selecionadas = [];
        $total_cartas = 0;

        while ($total_cartas < $max_cartas) {
            $c = $cartas->random();

            if (isset($selecionadas[$c->id])) {
                // dd($cartas->pluck('metadata.rarity'));
                // dd($c->metadata->ratity);

                if ($c->metadata->rarity == 'LEGENDARY' && $selecionadas[$c->id] >= $max_lendarias) {
                    continue;
                }

                if ($selecionadas[$c->id]  < $max_amostras) {
                    $selecionadas[$c->id] += 1;
                    $cartas_selecionadas[] = $c;
                    $total_cartas++;
                }
            } else {
                $selecionadas[$c->id] = 1;
                $cartas_selecionadas[] = $c;
                $total_cartas++;
            }
        }

        return $cartas_selecionadas;
    }

    public static function select_pandora($cartas, $max_cartas = 30, $max_cores = 3, $max_tesouros = 3, $tesouro_repetido = false, $inclui_3desejos = false)
    {
        $selecionadas = [];
        $cartas_selecionadas = [];
        $total_cartas = 0;
        $total_tesouros = 0;
        $cores_selecionadas = [];

        if ($max_tesouros <> 0) {
            $tesouros = $cartas->where('metadata.color', 'PANDORA')->take($max_tesouros);

            foreach ($tesouros as $tesouro) {
                $cartas_selecionadas[] = $tesouro;
                $selecionadas[$tesouro->id] = 1;
            }
            $total_cartas = $max_tesouros;
        }

        if ($tesouro_repetido) {
            if ($max_tesouros <> 0) {
                array_pop($cartas_selecionadas);
                array_pop($selecionadas);
            }

            $c = $tesouros->first();
            $cartas_selecionadas[] = $c;
            $selecionadas[$c->id] += 1;
        }

        if ($inclui_3desejos) {
            $c = $cartas->where('metadata.card_id', '350')->first();
            $cartas_selecionadas[] = $c;
            $selecionadas[$c->id] = 1;
            $total_cartas++;
        }

        if ($max_cores > 3) {
            $cartas_selecionadas[] = $cartas->where('metadata.color', 'RED')->first();
            $cartas_selecionadas[] = $cartas->where('metadata.color', 'BLUE')->first();
            $cartas_selecionadas[] = $cartas->where('metadata.color', 'GREEN')->first();
            $cartas_selecionadas[] = $cartas->where('metadata.color', 'YELLOW')->first();
            $total_cartas += 4;
        }

      //dd($selecionadas);

      while ($total_cartas < $max_cartas) {
          $c = $cartas->random();

          if (!in_array($c->metadata->color, $cores_selecionadas) && count($cores_selecionadas) == $max_cores) {
              continue;
          }

          if ($c->metadata->card_id == 350 || $c->metadata->color == 'PANDORA') {
              continue;
          }

          $cores_selecionadas[$c->metadata->color] = $c->metadata->color;
          $cartas_selecionadas[] = $c;
          $selecionadas[$c->id] = isset($selecionadas[$c->id]) ? $selecionadas[$c->id] + 1 :  1;
          $total_cartas++;
      }

        return $cartas_selecionadas;
    }

    public static function toJson(array $cartas)
    {
        $cartas = collect($cartas)->sortBy('id')->pluck('id')->toArray();
        $cartas = array_count_values($cartas);

        $c = [];
        foreach ($cartas as $k => $v) {
            $c[] = ['id' => $k, 'total' => $v];
        }

        return $c;
    }

    // deck padrao pandora
    public static function pandora()
    {
        $cartas = App\Carta::inRandomOrder()->take(300)->get();
        $tesouros = App\Carta::where('metadata->color', 'PANDORA')->take(3)->get();
        $desejos3 = App\Carta::where('metadata->card_id', 350)->get();
        $cartas = $cartas->merge($tesouros);
        $cartas = $cartas->merge($desejos3);

        return  self::select_pandora($cartas);
    }

    // deck padrao batalha
    public static function batalha()
    {
        $cartas = App\Carta::inRandomOrder()->where('metadata->color', '<>', 'PANDORA')->take(20)->get();
        return  self::select_batalha($cartas);
    }

    // Não tem exatamente 3 TESOUROS (diferentes entre si)
    public static function nao_tem_3_tesouros_diferentes()
    {
        $cartas = App\Carta::inRandomOrder()->take(300)->get();

        return  self::select_pandora($cartas, 30, 3, 3, true);
    }

    // Contém a carta 3 desejos
    public static function pandora_com_3_desejos()
    {
        $cartas = App\Carta::inRandomOrder()->take(300)->get();
        $tesouros = App\Carta::where('metadata->color', 'PANDORA')->take(3)->get();
        $desejos3 = App\Carta::where('metadata->card_id', 350)->get();
        $cartas = $cartas->merge($tesouros);
        $cartas = $cartas->merge($desejos3);

        return  self::select_pandora($cartas, 30, 3, 3, false, true);
    }

    // pandora com 4 cores
    public static function pandora_4_cores()
    {
        $cartas = App\Carta::inRandomOrder()->take(300)->get();
        $tesouros = App\Carta::where('metadata->color', 'PANDORA')->take(3)->get();
        $desejos3 = App\Carta::where('metadata->card_id', 350)->get();
        $cartas = $cartas->merge($tesouros);
        $cartas = $cartas->merge($desejos3);

        return  self::select_pandora($cartas, 30, 4, 3, false);
    }

    // Não tem no máximo 3 amostras de cada carta
    public static function batalha_mais_3_amostras()
    {
        $cartas = App\Carta::inRandomOrder()->where('metadata->color', '<>', 'PANDORA')->take(12)->get();

        return  self::select_batalha($cartas, 30, 4, 1);
    }

    // Ranqueado Com cartas pandora
    public static function batalha_com_cartas_pandora()
    {
        $cartas = App\Carta::inRandomOrder()->where('metadata->color', 'PANDORA')->take(3)->get();
        $cartas2 = App\Carta::inRandomOrder()->where('metadata->color', '<>', 'PANDORA')->take(20)->get();

        $cartas = $cartas->merge($cartas2);

        return  self::select_batalha($cartas, 30, 3, 1);
    }

    // Não tem exatamente 30 cartas
    public static function nao_tem_30_cartas()
    {
        $cartas = App\Carta::inRandomOrder()->take(300)->get();

        return  self::select_batalha($cartas, 22, 3, 1);
    }

    public static function batalha_mais_1_copia_lendaria()
    {
        $cartas = App\Carta::inRandomOrder()->where('metadata->color', '<>', 'PANDORA')->take(20)->get();
        $lendarias = App\Carta::inRandomOrder()->where('metadata->rarity', 'LEGENDARY')->take(24)->get();

        $cartas = $cartas->merge($lendarias);

        return  self::select_batalha($cartas, 30, 3, 99);
    }
}

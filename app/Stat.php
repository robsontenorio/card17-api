<?php

namespace App;

use Illuminate\Support\Facades\DB;

class Stat extends Model
{
    public static function matchups($tipo)
    {
        if ($tipo === 'winrate') {
            $ordem = "round((sum(partidas.evento = 1) / count(partidas.evento)) * 100) DESC";
        } else {
            $ordem = "SUM(partidas.evento = 1) + SUM(partidas.evento = -1) DESC";
        }

        // cores + arquetipos
      $matchups = Matchup::select(
                            DB::raw("SUBSTRING_INDEX(hash, '#', 1) as arquetipo"),
                            DB::raw("SUBSTRING_INDEX(SUBSTRING_INDEX(hash, '#', 2), '#', '-1') as cores"),
                            DB::raw("round((sum(partidas.evento = 1) / count(partidas.evento)) * 100)  as winrate"),
                            DB::raw("sum(partidas.evento = 1)  as vitorias"),
                            DB::raw("sum(partidas.evento = -1) as derrotas"),
                            DB::raw("sum(partidas.evento = -1) + sum(partidas.evento = 1) as total")
                            )
                            ->join('partidas', 'partidas.matchup_id', '=', 'matchups.id')
                            ->groupBy('arquetipo')
                            ->groupBy('cores')
                            ->havingRaw("(vitorias + derrotas) >= 50") // TODO aumentar depois
                            ->orderByRaw(DB::raw($ordem))
                            ->take(10)
                            ->get();

        $matchups = $matchups->map(function ($item) {
            $cores = explode(',', $item->cores);
            return (object)[
                          'winrate' => (int) $item->winrate,
                          'derrotas' => (int) $item->derrotas,
                          'vitorias' => (int) $item->vitorias,
                          'total' => (int) $item->total,
                          'arquetipo' => Arquetipo::where('id', $item->arquetipo)->first(),
                          'cores' => Cor::whereIn('id', $cores)->get()
                      ];
        });

        // cores + tipos
        $matchups2 = Matchup::select(
                              DB::raw("SUBSTRING_INDEX(hash,'#',-1) as tipos"),
                              DB::raw("SUBSTRING_INDEX(SUBSTRING_INDEX(hash, '#', 2), '#', '-1') as cores"),
                              DB::raw("round((sum(partidas.evento = 1) / count(partidas.evento)) * 100)  as winrate"),
                              DB::raw("sum(partidas.evento = 1)  as vitorias"),
                              DB::raw("sum(partidas.evento = -1) as derrotas"),
                              DB::raw("sum(partidas.evento = -1) + sum(partidas.evento = 1) as total")
                              )
                              ->join('partidas', 'partidas.matchup_id', '=', 'matchups.id')
                              ->groupBy('tipos')
                              ->groupBy('cores')
                              ->havingRaw("(vitorias + derrotas) >= 50 AND tipos > 0") // TODO aumentar depois
                              ->orderByRaw(DB::raw($ordem))
                              ->take(10)
                              ->get();

        $matchups2 = $matchups2->map(function ($item) {
            $cores = explode(',', $item->cores);
            $tipos = explode(',', $item->tipos);

            return (object)[
                'winrate' => (int) $item->winrate,
                'derrotas' => (int) $item->derrotas,
                'vitorias' => (int) $item->vitorias,
                'total' => (int) $item->total,
                'tipos' => Tipo::whereIn('id', $tipos)->get(),
                'cores' => Cor::whereIn('id', $cores)->get()
            ];
        });

        $matchups = $matchups->merge($matchups2);

        // cores + arquetipos + tipos
        $matchups3 = Matchup::select(
                              DB::raw("SUBSTRING_INDEX(hash, '#', 1) as arquetipo"),
                              DB::raw("SUBSTRING_INDEX(hash,'#',-1) as tipos"),
                              DB::raw("SUBSTRING_INDEX(SUBSTRING_INDEX(hash, '#', 2), '#', '-1') as cores"),
                              DB::raw("round((sum(partidas.evento = 1) / count(partidas.evento)) * 100)  as winrate"),
                              DB::raw("sum(partidas.evento = 1)  as vitorias"),
                              DB::raw("sum(partidas.evento = -1) as derrotas"),
                              DB::raw("sum(partidas.evento = -1) + sum(partidas.evento = 1) as total")
                              )
                              ->join('partidas', 'partidas.matchup_id', '=', 'matchups.id')
                              ->groupBy('tipos')
                              ->groupBy('cores')
                              ->groupBy('arquetipo')
                              ->havingRaw("(vitorias + derrotas) >= 50 AND tipos > 0") // TODO aumentar depois
                              ->orderByRaw(DB::raw($ordem))
                              ->take(10)
                              ->get();

        $matchups3 = $matchups3->map(function ($item) {
            $cores = explode(',', $item->cores);
            $tipos = explode(',', $item->tipos);

            return (object)[
                'winrate' => (int) $item->winrate,
                'derrotas' => (int) $item->derrotas,
                'vitorias' => (int) $item->vitorias,
                'total' => (int) $item->total,
                'tipos' => Tipo::whereIn('id', $tipos)->get(),
                'cores' => Cor::whereIn('id', $cores)->get(),
                'arquetipo' => Arquetipo::where('id', $item->arquetipo)->first()
            ];
        });

        $matchups= $matchups->merge($matchups3);

        $matchups = $matchups->sortByDesc($tipo)->take(5)->values()->all();

        return $matchups;
    }
}

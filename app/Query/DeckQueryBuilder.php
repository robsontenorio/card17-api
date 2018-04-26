<?php

namespace App\Query;

use Unlu\Laravel\Api\QueryBuilder;
use Illuminate\Support\Facades\DB;

class DeckQueryBuilder extends QueryBuilder
{
    public function filterByModoChave($query, $name)
    {
        return $query->whereHas('modo', function ($q) use ($name) {
            return $q->where('chave', $name);
        });
    }

    public function filterByOrdem($query, $name)
    {
        return $query->where(DB::raw('vitorias + derrotas'), '>=', 50)->orderBy('winrate', 'desc'); // TODO aumentar depois
    }
}

<?php

namespace App\Query;

use Unlu\Laravel\Api\QueryBuilder;
use Illuminate\Support\Facades\DB;

class UserQueryBuilder extends QueryBuilder
{
    public function filterByOrdem($query, $name)
    {
        return $query->where(DB::raw('vitorias + derrotas'), '>=', 50)->orderBy('winrate', 'desc'); // TODO aumentar depois
    }
}

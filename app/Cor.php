<?php

namespace App;

class Cor extends Model
{
    protected $table = 'cores';

    public function matchups()
    {
        return $this->belongsToMany('App\Cor', 'matchup_cor', 'matchup_id', 'cor_id');
    }
}

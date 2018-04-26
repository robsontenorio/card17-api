<?php

namespace App;

class Modo extends Model
{
    public function decks()
    {
        return $this->hasMany('App\Deck');
    }
}

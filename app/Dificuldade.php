<?php

namespace App;

class Dificuldade extends Model
{
    public function decks()
    {
        return $this->hasMany('App\Deck');
    }
}

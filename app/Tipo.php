<?php

namespace App;

use Spatie\Translatable\HasTranslations;

class Tipo extends Model
{
    use HasTranslations;

    public $translatable = ['nome'];

    public function matchups()
    {
        return $this->belongsToMany('App\Matchup', 'matchup_tipo', 'tipo_id', 'matchup_id');
    }

    public function getNomeAttribute($value)
    {
        if (isset(json_decode($value, true)[app()->getLocale()])) {
            return json_decode($value, true)[app()->getLocale()];
        } else {
            return json_decode($value, true)['en'];
        }
    }
}

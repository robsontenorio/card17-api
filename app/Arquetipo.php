<?php

namespace App;

use Spatie\Translatable\HasTranslations;

class Arquetipo extends Model
{
    use HasTranslations;

    public $translatable = ['nome'];

    public function getNomeAttribute($value)
    {
        if (isset(json_decode($value, true)[app()->getLocale()])) {
            return json_decode($value, true)[app()->getLocale()];
        } else {
            return json_decode($value, true)['en'];
        }
    }
}

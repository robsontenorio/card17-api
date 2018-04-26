<?php

namespace App;

use Illuminate\Database\Eloquent\Model as BaseModel;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class Model extends BaseModel
{
    protected $rules = [];

    protected $guardado = []; // usado para fazer merge nas classes filhas

    protected $guarded = [
            'id',
            'user_id',
            'api_token',
            'created_at',
            'updated_at',
            'deleted_at'
    ];

    protected $appends = [
        //	'links'
    ];

    protected $links = [];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->guarded = array_merge($this->guardado, parent::getGuarded());
    }

    public static function boot()
    {
        parent::boot();

        self::saving(function ($model) {
            $model->validar();
        });
    }

    public function validar()
    {
        $values = [];

        foreach ($this->rules as $prop => $_) {
            $values[$prop] = $this->$prop;
        }

        Validator::make($values, $this->rules)->validate();
    }

    // public function getLinksAttribute()
    // {
    //     $links = [];
    //
    //     foreach ($this->links as $k => $v) {
    //         // TODO: fazer para mais de 1 nivel. Ex: /jogos/{jogo_id}/users/{user_id}
    //         preg_match_all('/{(.*?)}/', $v, $matches);
    //
    //         if (isset($this->attributes[$matches[1][0]])) {
    //             $links[$k] = str_replace($matches[0][0], $this->attributes[$matches[1][0]], $v);
    //         }
    //     }
    //
    //     return $this->attributes['links'] = $links;
    // }
}

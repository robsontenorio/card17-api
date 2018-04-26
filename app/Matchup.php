<?php

namespace App;

use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

class Matchup extends Model
{
    protected $fillable = [
      'arquetipo_id'
    ];

    public function arquetipo()
    {
        return $this->belongsTo('App\Arquetipo');
    }

    public function tipos()
    {
        return $this->belongsToMany('App\Tipo', 'matchup_tipo', 'matchup_id', 'tipo_id');
    }

    public function cores()
    {
        return $this->belongsToMany('App\Cor', 'matchup_cor', 'matchup_id', 'cor_id');
    }

    public function decks()
    {
        return $this->hasMany('App\Deck');
    }

    public function partidas()
    {
        return $this->hasMany('App\Partida');
    }

    public static function build($matchup)
    {
        // preparando variaveis
        $matchup->arquetipo_id = $matchup->arquetipo_id ?: null;
        $matchup->cores = isset($matchup->cores) ? $matchup->cores : [];
        $matchup->tipos = isset($matchup->tipos) ? $matchup->tipos : [];

        // Identificando se existe algum matchup igual
        $hash = Matchup::hash($matchup);
        $m =  Matchup::where('hash', $hash)->first();

        if ($m == null) {
            $m = new Matchup();
            $m->arquetipo_id = $matchup->arquetipo_id;
            $m->hash = $hash;
            // TODO tem como associar antes de salvar, pra validar na Policy? precisei salvar primeiro $m->save()
            // TODO isto deveria ser dentro da Policy, mas make() ao inves de attach() não funciona para pivots
            if ($matchup->arquetipo_id === null) {
                throw new BadRequestHttpException(__("Selecione um arquétipo"));
            }

            $m->save();
            $m->cores()->attach($matchup->cores);
            $m->tipos()->attach($matchup->tipos);
        }

        return $m;
    }

    public static function hash($matchup)
    {
        $cores = $matchup->cores;
        $tipos = $matchup->tipos;
        sort($tipos);
        sort($cores);

        return $matchup->arquetipo_id.'#'.implode(',', $cores).'#'.implode(',', $tipos);
    }
}

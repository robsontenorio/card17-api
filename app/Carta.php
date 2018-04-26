<?php

namespace App;

use Spatie\Translatable\HasTranslations;

class Carta extends Model
{
    use HasTranslations;

    public $translatable = ['nome', 'texto'];

    protected $appends = ['total'];

    protected $casts = ['metadata' => 'array'];

    public function decks()
    {
        return $this->belongsToMany('App\Deck');
    }

    public function getTotalAttribute()
    {
        //TODO nos casos de pegar somente cartas, sem o relacionamento com o deck
        if (!isset($this->pivot)) {
            return null;
        }

        return $this->pivot->total;
    }

    public function getNomeAttribute($value)
    {
        return json_decode($value, true)[app()->getLocale()];
    }

    public function getTextoAttribute($value)
    {
        return json_decode($value, true)[app()->getLocale()];
    }

    // card_id;color;card_name;card_type;gold;faeria;lake;forest;mountain;desert;power;life;text;codex;number_in_codex;_codex_id;rarity
    public function getMetadataAttribute($value)
    {
        $metadata = json_decode($value);
        $metadata->card_id = str_pad($metadata->card_id, 3, 0, STR_PAD_LEFT);

        return (object) $metadata;

        $carta['card_id'] = str_pad($metadata->card_id, 3, 0, STR_PAD_LEFT);
        $carta['color'] = $metadata->color;
        $carta['card_name'] = $metadata[2];
        $carta['card_type'] = $metadata[3];
        $carta['gold'] = $metadata[4];
        $carta['faeria'] = $metadata[5];
        $carta['lake'] = $metadata[6];
        $carta['forest'] = $metadata[7];
        $carta['mountain'] = $metadata[8];
        $carta['desert'] = $metadata[9];
        $carta['power'] = $metadata[10];
        $carta['life'] = $metadata[11];
        $carta['text'] = $metadata[12];
        $carta['codex'] = $metadata[13];
        $carta['number_in_codex'] = $metadata[14];
        $carta['_codex_id'] = $metadata[15];
        $carta['rarity'] = $metadata[16];

        return (object) $carta;
    }

    public static function build($cartas)
    {
        $c = new Collection();

        foreach ($cartas as $carta) {
            $ca = Carta::find($carta['id']);
            $ca->totalx = $carta['total']; // TODO não deixou alterar o atributo original
            $c->add($ca);
        }

        return $c;
    }

    public static function extrairTotais($carta)
    {
        $cores = [];
        if ($carta->metadata->forest <> null) {
            $cores[] = ['GREEN' => $carta->total];
        } elseif ($carta->metadata->lake <> null) {
            $cores[] = ['BLUE' => $carta->total];
        } elseif ($carta->metadata->mountain <> null) {
            $cores[] = ['RED' => $carta->total];
        } elseif ($carta->metadata->desert <> null) {
            $cores[] = ['YELLOW' => $carta->total];
        } else {
            $cores[] = ['HUMAN' => $carta->total];
        }

        return $cores;
    }

    public static function extrairCores($cartas)
    {
        $chaves = $cartas->whereNotIn('metadata.color', ['PANDORA'])->pluck('metadata.color')->unique();
        $cores = Cor::whereIn('chave', $chaves)->orderBy('id')->pluck('id')->toArray();
        return $cores;
    }
}

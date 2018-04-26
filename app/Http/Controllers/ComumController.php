<?php

namespace App\Http\Controllers;

use App\Stat;
use App\User;
use App\Deck;
use App\Modo;
use App\Carta;
use App\Matchup;
use App\Partida;
use App\Arquetipo;
use App\Cor;
use App\Tipo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;

class ComumController extends Controller
{
    public function listar(Request $request)
    {
        return [
          'arquetipos' => Arquetipo::orderBy('nome->'.app()->getLocale())->get(),
          'tipos' => Tipo::orderBy('nome->'.app()->getLocale())->get(),
          'cores' => Cor::all(),
          'cartas' => Carta::all(),
          'modos' => Modo::all()
        ];
    }

    public function stats(Request $request)
    {
        return [
          'matchups' => [
              'mais_jogados' => Stat::matchups('total'),
              'melhor_winrate' => Stat::matchups('winrate')
            ]
      ];
    }

    public function welcome(Request $request)
    {
        $partidas_pandora = Partida::with('deck')->whereHas('deck.modo', function ($q) {
            return $q->where('chave', 'PANDORA');
        })->count();

        $partidas_batalha = Partida::with('deck')->whereHas('deck.modo', function ($q) {
            return $q->where('chave', 'BATALHA');
        })->count();

        return [
        'users' => User::count(),
        'partidas_pandora' => $partidas_pandora,
        'partidas_batalha' => $partidas_batalha,
        'partidas' => $partidas_pandora + $partidas_batalha,
        'decks' => Deck::count(),
        'modos' => [
          'pandora' => User::topModo('PANDORA'),
          'batalha' => User::topModo('BATALHA'),
        ]
      ];
    }

    // public function ajustar_matchups()
    // {
    //     $matchups = Matchup::all();
    //
    //     foreach ($matchups as $matchup) {
    //         if (!strstr($matchup->hash, ',')) {
    //             $cores = implode(',', $matchup->cores->pluck('id')->toArray());
    //             $tipos = implode(',', $matchup->tipos->pluck('id')->toArray());
    //             $matchup->hash = $matchup->arquetipo_id.'#'.$cores.'#'.$tipos;
    //             $matchup->save();
    //         }
    //     }
    // }

    public function importar_cards(Request $request)
    {
        set_time_limit(999999999);
        ini_set('memory_limit', '2048M');
        $langs = ['br', 'en', 'ko', 'es', 'de', 'fr'];
        $base = self::traducoes_cartas('en');

        Excel::load(storage_path('cards/cards.csv'))->each(function ($line) use ($langs, $base) {
            $card_id = $line->get('card_id');

            $carta = Carta::where('id', $card_id)->first();
            $carta = $carta?: new Carta();

            // possui tradução? cartas com codex_id 106666 não possuem arquivo de tradução separado
            if (isset($base[$card_id])) {
                // cria ou atualiza
                $carta->id = $card_id;
                $i = 0;
                foreach ($langs as $lang) {
                    $i++;
                    $translation = self::traducoes_cartas($lang);
                    $carta->setTranslation('nome', $lang, $translation[$card_id]['nome']);
                    $carta->setTranslation('texto', $lang, $translation[$card_id]['texto']?: '');
                }

                $carta->metadata = $line;
                $carta->save();
                // dd($carta->toArray());
            }
            unset($carta);
        });
    }

    public function ajusta_traducao($str, $lang)
    {
        $en[] = '{ranged_attack';
        $en[] = '{gift';
        $en[] = '{charge';
        $en[] = '{production';
        $en[] = '{combat';
        $en[] = '{protection';
        $en[] = '{taunt';
        $en[] = '{haste';
        $en[] = '{last_words';
        $en[] = '{deathtouch';
        $en[] = '{aquatic';
        $en[] = '{jump';
        $en[] = '{flying';
        $en[] = '{activate';

        $br[] = '{projéteis';
        $br[] = '{presentear';
        $br[] = '{investir';
        $br[] = '{produção';
        $br[] = '{combate';
        $br[] = '{proteção';
        $br[] = '{provocar';
        $br[] = '{rapidez';
        $br[] = '{última vontade';
        $br[] = '{toque fatal';
        $br[] = '{aquático';
        $br[] = '{pular';
        $br[] = '{voar';
        $br[] = '{ativar';


        $str = strip_tags($str);
        $str = str_replace('\\n', " ", $str);

        $str = str_replace($en, $$lang, $str);

        return $str;
    }

    public function traducoes_cartas($lang)
    {
        $arr = [];

        Excel::load(storage_path("cards/{$lang}.csv"))->each(function ($line) use (&$arr) {
            $key =  explode('.', $line->get('key'));
            $card_id = $key[0];
            $tipo = $key[1];
            $value =  $line->get('value');

            if ($tipo == 'name') {
                $arr[$card_id]['nome'] = $value;
            } elseif ($tipo == 'text') {
                $arr[$card_id]['texto'] = $value;
            }
        });

        return $arr;
    }
}

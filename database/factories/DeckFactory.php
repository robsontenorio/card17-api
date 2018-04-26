<?php

use App\Modo;
use Tests\DeckHelper;
use Tests\MatchupHelper;

$factory->define(App\Deck::class, function (Faker\Generator $faker) {
    return [
        'user_id' => factory(App\User::class)->create()->id,
        'dificuldade_id' => factory(App\Dificuldade::class)->create()->id,
        'custo' => "4.8",
        'nome' => $faker->name,
        'descricao' => $faker->text
    ];
});


$factory->state(App\Deck::class, 'pandora', function (Faker\Generator $faker) {
    return [
        'modo_id' => Modo::where('chave', 'PANDORA')->first()->id,
        'matchup_id' => MatchupHelper::build('pandora')->id
    ];
});

$factory->state(App\Deck::class, 'batalha', function (Faker\Generator $faker) {
    return [
        'modo_id' => App\Modo::where('chave', 'BATALHA')->first()->id,
        'matchup_id' => MatchupHelper::build('batalha')->id,
    ];
});


// Não tem pelo menos 1 arquetipo associado
$factory->state(App\Deck::class, 'invalido_sem_arquetipos', function (Faker\Generator $faker) {
    return [
        'matchup_id' => MatchupHelper::build('batalha', false)->id
    ];
});

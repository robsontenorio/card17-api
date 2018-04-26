<?php
use Tests\MatchupHelper;

$factory->define(App\Partida::class, function (Faker\Generator $faker) {
    return [
        // 'temporada_id' => factory(App\Temporada::class)->create()->id,
        'evento' => $faker->randomElement([1,-1]),
        'primeiro' => $faker->randomElement([1,0]),
    ];
});


$factory->state(App\Partida::class, 'batalha', function (Faker\Generator $faker) {
    return [
        'deck_id' => factory(App\Deck::class)->states('batalha')->create()->id,
        'matchup_id' => MatchupHelper::build('batalha')->id,
        'ranking' => $faker->randomNumber(1),
        'god' => $faker->randomElement([1,0])
    ];
});

$factory->state(App\Partida::class, 'pandora', function (Faker\Generator $faker) {
    return [
      'deck_id' => factory(App\Deck::class)->states('pandora')->create()->id,
      'matchup_id' => MatchupHelper::build('pandora')->id
    ];
});


$factory->state(App\Partida::class, 'sem_cores', function (Faker\Generator $faker) {
    return [
        'matchup_id' => MatchupHelper::build('batalha', true, false)->id,
    ];
});

$factory->state(App\Partida::class, '4_cores', function (Faker\Generator $faker) {
    return [
        'matchup_id' => MatchupHelper::build('pandora', true, true, 4)->id,
    ];
});

$factory->state(App\Partida::class, 'sem_arquetipos', function (Faker\Generator $faker) {
    return [
        'matchup_id' => MatchupHelper::build('batalha', false)->id,
    ];
});

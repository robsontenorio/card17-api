<?php

$factory->define(App\Temporada::class, function (Faker\Generator $faker) {
    static $password;

    return [
        'user_id' => factory(App\User::class)->create()->id,
        'nome' => $faker->name,
        'aberta' => 1
    ];
});


$factory->state(App\Temporada::class, 'encerrada', function (Faker\Generator $faker) {
    return [
        'aberta' => 0
    ];
});

<?php

$factory->define(App\Dificuldade::class, function (Faker\Generator $faker) {
    return [
        'nome' => $faker->name,
        'chave' => $faker->randomElement(['FACIL', 'MEDIO', 'DIFICIL']),
    ];
});

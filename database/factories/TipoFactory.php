<?php

$factory->define(App\Tipo::class, function (Faker\Generator $faker) {
    return [
        'nome' => $faker->name,
        'descricao' => $faker->text,
    ];
});

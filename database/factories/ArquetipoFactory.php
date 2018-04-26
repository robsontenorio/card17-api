<?php

$factory->define(App\Arquetipo::class, function (Faker\Generator $faker) {
    return [
        'nome' => $faker->name,
        'descricao' => $faker->text,
    ];
});

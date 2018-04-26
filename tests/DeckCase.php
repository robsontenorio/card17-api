<?php

namespace Tests;

use App\Tipo;
use App\Arquetipo;

abstract class DeckCase extends TestCase
{
    public function setUp()
    {
        parent::setUp();

        if (Arquetipo::count() == 0) {
            factory(Arquetipo::class, 4)->create();
            factory(Tipo::class, 10)->create();
        }
    }
}

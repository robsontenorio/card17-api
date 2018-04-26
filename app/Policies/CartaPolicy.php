<?php

namespace App\Policies;

use App\User;
use App\Carta;
use Illuminate\Auth\Access\HandlesAuthorization;

class CartaPolicy
{
    use HandlesAuthorization;

    public function __construct()
    {
    }
}

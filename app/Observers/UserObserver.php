<?php

namespace App\Observers;

use App\User;
use App\Temporada;

class UserObserver
{
    public function created(User $user)
    {
        $temporada = Temporada::make(['nome' => __("Temporada inicial")]);
        $temporada->user_id = $user->id;
        $temporada->aberta = 1;
        $temporada->save();
    }
}

<?php

namespace App\Policies;

use App\User;
use App\Temporada;
use Illuminate\Auth\Access\HandlesAuthorization;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

class TemporadaPolicy
{
    use HandlesAuthorization;

    public function delete(User $user, Temporada $temporada)
    {
        if ($user->temporadas->count() == 1) {
            throw new BadRequestHttpException(__("Não é possível remover a Temporada Inicial"));
        }

        if ($temporada->user_id <> $user->id) {
            throw new BadRequestHttpException(__("Não autorizado"));
        }
    }
}

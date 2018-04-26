<?php

namespace App\Policies;

use App\Deck;
use App\User;
use App\Matchup;
use Illuminate\Auth\Access\HandlesAuthorization;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

class MatchupPolicy
{
    use HandlesAuthorization;

    public function __construct()
    {
        //
    }

    public function create(User $user, Matchup $matchup, $modo)
    {
        // Deve haver ARQUETIPOS
        if ($matchup->arquetipo_id === null) {
            throw new BadRequestHttpException(__("Selecione um arquétipo"));
        }

        // Deve haver CORES
        if ($matchup->cores->count() == 0) {
            throw new BadRequestHttpException(__("Selecione pelo menos uma cor"));
        }

        // PANDORA
        if ($modo == 'PANDORA') {
            // Max 4 cores
            if ($matchup->cores->whereNotIn('chave', ['PANDORA', 'HUMAN'])->pluck('chave')->unique()->count() > 3) {
                throw new BadRequestHttpException(__("Uma matchup PANDORA deve conter no máximo 3 cores"));
            }
        }
    }
}

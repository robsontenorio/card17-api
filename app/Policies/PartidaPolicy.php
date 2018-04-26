<?php

namespace App\Policies;

use App\Deck;
use App\User;
use App\Partida;
use Illuminate\Auth\Access\HandlesAuthorization;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

class PartidaPolicy
{
    use HandlesAuthorization;

    // TODO ???
    public function __construct()
    {
        //
    }

    public function delete(User $user, Partida $partida)
    {
        if ($partida->deck->user_id <> $user->id) {
            throw new BadRequestHttpException(__("Não autorizado"));
        }
    }

    public function create(User $user, Partida $partida, Deck $deck)
    {
        // O usuário é dono do deck
        if ($deck->user_id <> $user->id) {
            throw new BadRequestHttpException(__("Não autorizado"));
        }

        if ($deck->modo->chave == 'PANDORA') {
            // Jornada pandora encerrada?
            $vitorias = $deck->partidas()->where('evento', 1)->count();
            $derrotas = $deck->partidas()->where('evento', -1)->count();
            if ($vitorias === 9 || $derrotas === 3) {
                throw new BadRequestHttpException(__("Jornada PANDORA encerrada"));
            }
        }
    }
}

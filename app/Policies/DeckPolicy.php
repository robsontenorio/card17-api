<?php

namespace App\Policies;

use App\Deck;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

class DeckPolicy
{
    use HandlesAuthorization;

    public function __construct()
    {
        //
    }

    public function create(User $user, Deck $deck)
    {
    }

    public function delete(User $user, Deck $deck)
    {
        $this->update($user, $deck);
    }

    public function update(User $user, Deck $deck)
    {
        if ($deck->user_id <> $user->id) {
            throw new BadRequestHttpException(__("Não autorizado"));
        }
    }

    public function create_cartas(User $user, Deck $deck, $cartas)
    {
        $max_amostras = max($cartas->pluck('totalx', 'id')->toArray()); // TODO não deixou eu alterar o atributo
        $total_cartas = $cartas->pluck('totalx', 'id')->sum();

      // no máximo 30 cartas
      if ($total_cartas <> 30) {
          throw new BadRequestHttpException(__("O deck deve conter exatamente 30 cartas"));
      }

      // VALIDAÇÕES BATALHA
      if ($deck->modo->chave == 'BATALHA') {
          // no máximo 3 amostras por carta
          if ($max_amostras > 3) {
              throw new BadRequestHttpException(__("Um deck BATALHA deve conter no máximo 3 cópias de cada carta"));
          }
          // não é permitido cartas do modo pandora
          if (in_array('PANDORA', $cartas->pluck('metadata.color')->toArray())) {
              throw new BadRequestHttpException(__("Um deck BATALHA não deve possuir cartas do MODO PANDORA"));
          }
          // apenas 1 lendária por carta escolhida
          if ($cartas->where('metadata.rarity', 'LEGENDARY')->where('totalx', '>', 1)->count()) { //TODO totalx
              throw new BadRequestHttpException(__("Um deck BATALHA deve conter apenas uma cópia de cada carta lendária"));
          }
      }

      // VALIDAÇÕES PANDORA
      if ($deck->modo->chave == 'PANDORA') {
          // 3 tesouros, diferentes entre si
          if ($cartas->where('metadata.color', 'PANDORA')->pluck('totalx')->sum() <> 3 ||
              $cartas->where('metadata.color', 'PANDORA')->pluck('totalx')->max() <> 1) { // TODO totalx
              throw new BadRequestHttpException(__("Um deck PANDORA deve conter exatamente 3 tesouros diferentes entre si"));
          }
          // contem a carta 3 desejos
          if ($cartas->where('metadata.card_id', '350')->count()) {
              throw new BadRequestHttpException(__("A carta 3 DESEJOS não é permitida no MODO PANDORA"));
          }
          // contem 4 cores
          if ($cartas->whereNotIn('metadata.color', ['PANDORA', 'HUMAN'])->pluck('metadata.color')->unique()->count() == 4) {
              throw new BadRequestHttpException(__("Um deck PANDORA deve possuir no máximo 3 cores"));
          }
      }
    }
}

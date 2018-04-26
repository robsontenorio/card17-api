<?php

namespace Tests\Feature;

use App\User;
use App\Deck;
use Tests\DeckCase;
use Tests\DeckHelper;

class DeckTest extends DeckCase
{
    /*
     * DADO que sou um usuário logado
     * DADO que o deck pertence a mim
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar o deck excluido
     */

    public function test_excluir_deck()
    {
        // DADO que sou um usuário logado
        $user = factory(User::class)->create();

        // DADO que sou um usuário logado
        // DADO que o deck pertence a mim
        $deck = factory(Deck::class)->states('batalha')->make(['user_id' => $user->id]);
        $deck = DeckHelper::build($deck, 'batalha');

        $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());
        //dd($response->getContent());
        $deck_id = json_decode($response->getContent())->id;
        unset($deck->cartas);

        // QUANDO a requisição for processada
        $response = $this->actingAs($user, 'api')->delete("/decks/{$deck_id}", $deck->toArray());

        // ENTÃO devo visualizar o deck excluido
        $response->assertJsonFragment(['id' => $deck_id]);
    }

    /*
     * DADO que sou um usuário logado
     * DADO que o deck NÃO pertence a mim
     * DADO que o deck é do modo BATALHA
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar uma mensagem de erro
     */

    public function test_excluir_deck_outra_pessoa()
    {
        // DADO que sou um usuário logado
        $user = factory(User::class)->create();
        $outro_user = factory(User::class)->create();

        // DADO que sou um usuário logado
        // DADO que o deck NÃO pertence a mim
        // DADO que o deck é do modo BATALHA
        $deck = factory(Deck::class)->states('batalha')->make(['user_id' => $outro_user->id]);
        $deck = DeckHelper::build($deck, 'batalha');

        $response = $this->actingAs($outro_user, 'api')->post('/decks', $deck->toArray());
        //dd($response->getContent());
        $deck_id = json_decode($response->getContent())->id;
        unset($deck->cartas, $deck->matchups);

        // QUANDO a requisição for processada
        $response = $this->actingAs($user, 'api')->delete("/decks/{$deck_id}", $deck->toArray());

        // ENTÃO devo visualizar uma mensagem de erro
        $response->assertJsonFragment(['message' => 'Não autorizado']);
    }

    /*
     * DADO que sou um usuário logado
     * DADO que o deck pertence a mim
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar o deck atualizado
     */

    public function test_atualizar_deck()
    {
        // DADO que sou um usuário logado
        $user = factory(User::class)->create();

        // DADO que o deck pertence a mim
        $deck = factory(Deck::class)->states('batalha')->make(['user_id' => $user->id]);
        $deck = DeckHelper::build($deck, 'batalha');

        $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());
        $deck_id = json_decode($response->getContent())->id;

        $deck2 = factory(Deck::class)->states('batalha')->make(['user_id' => $user->id]);
        $deck2 = DeckHelper::build($deck2, 'batalha');
        $deck->cartas = $deck2->cartas;

        // QUANDO a requisição for processada
        $this->actingAs($user, 'api')->put("/decks/{$deck_id}", $deck->toArray());
        $response = $this->actingAs($user, 'api')->get("/decks/{$deck_id}?includes=cartas");
        $data = (object) json_decode($response->getContent());

        // ENTÃO devo visualizar o deck atualizado
        $cartas2 = json_encode(collect($data->cartas)->map(function ($item, $key) {
            return ['id' => $item->id, 'total' => $item->total];
        }));

        $cartas = json_encode($deck->cartas);

        $this->assertEquals($cartas, $cartas2);
    }
}

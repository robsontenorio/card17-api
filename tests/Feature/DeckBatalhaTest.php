<?php

namespace Tests\Feature;

use App;
use App\Deck;
use App\User;
use Tests\DeckCase;
use Tests\TestCase;
use Tests\DeckHelper;

class DeckBatalhaTest extends DeckCase
{

    /*
     * DADO que sou um usuário logado
     * DADO que os campos obrigatórios são preenchidos
     * DADO que existe uma TEMPORADA ativa
     * DADO que o deck é do modo BATALHA
     * DADO que o deck tem EXTAMENTE 30 cartas
     * DADO que o deck tem no MÁXIMO 3 AMOSTRAS de cada carta
     * DADO que o deck tem apenas 1 cópia de cada CARTA LENDÁRIA escolhida
     * DADO que o deck NÃO Possui cartas exclusivas do modo PANDORA
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar a configuração do deck criado
     * E as CARTAS associadas,
     * E EXATAMENTE 30 cartas
     * E no MÁXIMO 3 AMOSTRAS de cada carta
     * E apenas 1 cópia de cada CARTA LENDÁRIA escolhida
     * E os TIPOS associados, se houver
     */

    public function test_criar_deck_valido()
    {
        // DADO que sou um usuário logado
        $user = factory(User::class)->create();

        // DADO que os campos obrigatórios são preenchidos
        // DADO que o deck é do modo BATALHA
        // DADO que existe uma TEMPORADA ativa
        // DADO que o deck tem no MÁXIMO 3 AMOSTRAS de cada carta
        // DADO que o deck tem EXATAMENTE 30 cartas
        // DADO que o deck NÃO Possui cartas do modo PANDORA
        $deck = factory(Deck::class)->states('batalha')->make(['user_id' => $user->id]);
        $deck = DeckHelper::build($deck, 'batalha');
        $cartas = $deck->cartas;
        $matchup = $deck->matchup;
        // dd($cartas);
        // QUANDO a requisição for processada
        $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());
        // dd($response->getContent());
        $deck_id = json_decode($response->getContent())->id;

        unset($deck->cartas);
        unset($deck->matchup);

        // ENTÃO devo visualizar a configuração do deck criado
        $response->assertJsonFragment($deck->toArray());

        $response = $this->actingAs($user, 'api')->get("/decks/{$deck_id}?includes=cartas,matchup.cores,matchup.tipos");
        $data = (object) json_decode($response->getContent());

        // E as CARTAS associadas, sendo EXATAMENTE 30 e no MÁXIMO 3 AMOSTRAS de cada carta

        $cartas2 = json_encode(collect($data->cartas)->map(function ($item, $key) {
            return ['id' => $item->id, 'total' => $item->total];
        }));

        $cartas = json_encode($cartas);

        $this->assertEquals($cartas, $cartas2);
        $this->assertEquals(30, collect($data->cartas)->pluck('total')->sum());
        $this->assertLessThanOrEqual(3, collect($data->cartas)->pluck('total')->max());

        //E os TIPOS associados, se houver
        $this->assertEquals($matchup->tipos, collect($data->matchup->tipos)->pluck('id')->toArray());
    }

    /*
     * DADO que sou um usuário logado
     * DADO que os campos obrigatórios são preenchidos
     * DADO que o deck é do modo BATALHA
     * DADO que o deck não tem EXATAMENTE 30 cartas
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar uma mensagem de erro
     */

    public function test_criar_deck_invalido_30_cartas()
    {
        // DADO que sou um usuário logado
        $user = factory(User::class)->create();

        // DADO que os campos obrigatórios são preenchidos
        // DADO que o deck é do modo BATALHA
        // DADO que o deck não tem EXATAMENTE 30 cartas
        $deck = factory(Deck::class)->states('batalha')->make(['user_id' => $user->id]);
        $deck = DeckHelper::build($deck, 'nao_tem_30_cartas');

        // QUANDO a requisição for processada
        $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());

        // ENTÃO devo visualizar uma mensagem de erro
        $response->assertJsonFragment(['message' => 'O deck deve conter exatamente 30 cartas']);
    }

    /*
     * DADO que sou um usuário logado
     * DADO que os campos obrigatórios são preenchidos
     * DADO que o deck é do modo BATALHA
     * DADO que o deck NÃO tem no máximo 3 AMOSTRAS de cada carta
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar uma mensagem de erro
     */

    public function test_criar_deck_invalido_3_amostras()
    {
        // DADO que sou um usuário logado
        $user = factory(User::class)->create();

        // DADO que os campos obrigatórios são preenchidos
        // DADO que o deck é do modo batalha
        // DADO que o deck NÃO tem no máximo 3 AMOSTRAS de cada carta
        $deck = factory(Deck::class)->states('batalha')->make(['user_id' => $user->id]);
        $deck = DeckHelper::build($deck, 'batalha_mais_3_amostras');

        // QUANDO a requisição for processada
        $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());

        // ENTÃO devo visualizar uma mensagem de erro
        $response->assertJsonFragment(['message' => 'Um deck BATALHA deve conter no máximo 3 cópias de cada carta']);
    }

    /*
     * DADO que sou um usuário logado
     * DADO que os campos obrigatórios são preenchidos
     * DADO que o deck é do modo BATALHA
     * DADO que o deck POSSUI cartas exclusivadas do modo PANDORA
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar uma mensagem de erro
     */

    public function test_criar_deck_invalido_com_cartas_pandora()
    {
        // DADO que sou um usuário logado
        $user = factory(User::class)->create();

        // DADO que os campos obrigatórios são preenchidos
        // DADO que o deck é do modo BATALHA
        // DADO que o deck POSSUI cartas exclusivadas do modo PANDORA
        $deck = factory(Deck::class)->states('batalha')->make(['user_id' => $user->id]);
        $deck = DeckHelper::build($deck, 'batalha_com_cartas_pandora');


        // QUANDO a requisição for processada
        $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());

        // ENTÃO devo visualizar uma mensagem de erro
        $response->assertJsonFragment(['message' => 'Um deck BATALHA não deve possuir cartas do MODO PANDORA']);
    }


    /*
     * DADO que sou um usuário logado
     * DADO que os campos obrigatórios são preenchidos
     * DADO que o deck é do modo BATALHA
     * DADO que o deck tem apenas 1 cópia de cada CARTA LENDÁRIA escolhida
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar uma mensagem de erro
     */

    public function test_criar_deck_invalido_mais_1_copia_lendaria()
    {
        // DADO que sou um usuário logado
        $user = factory(User::class)->create();

        // DADO que os campos obrigatórios são preenchidos
        // DADO que o deck é do modo BATALHA
        // DADO que o deck tem apenas 1 cópia de cada CARTA LENDÁRIA escolhida

        $deck = factory(Deck::class)->states('batalha')->make(['user_id' => $user->id]);
        $deck = DeckHelper::build($deck, 'batalha_mais_1_copia_lendaria');

        // QUANDO a requisição for processada
        $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());

        // ENTÃO devo visualizar uma mensagem de erro
        $response->assertJsonFragment(['message' => 'Um deck BATALHA deve conter apenas uma cópia de cada carta lendária']);
    }
}

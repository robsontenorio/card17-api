<?php

namespace Tests\Feature;

use App;
use App\Deck;
use App\User;
use Tests\DeckCase;
use Tests\DeckHelper;

class DeckPandoraTest extends DeckCase
{

    /*
     * DADO que sou um usuário logado
     * DADO que os campos obrigatórios são preenchidos
     * DADO que existe uma TEMPORADA ativa
     * DADO que o deck é do modo PANDORA
     * DADO que o deck tem EXTAMENTE 30 CARTAS
     * DADO que o deck tem EXTAMENTE 3 cartas do tipo TESOURO (diferentes entre si)
     * DADO que o deck não contém a carta 3 DESEJOS
     * DADO que o deck tem no máximo 3 CORES (excluindo-se o NEUTRO)
     * QUANDO a requisição for processada
     * ENTÃO devo visualizar a configuração do deck criado
     * E as CARTAS associadas
     * E as EXATAMENTE 30 CARTAS associadas
     * E EXATAMENTE 3 TESOUROS (diferentes entre si)
     * E o deck não contém a carta 3 DESEJOS
     * E o deck tem no máximo 3 CORES (excluindo-se o NEUTRO)
     */


     public function test_criar_deck_valido()
     {
         // DADO que sou um usuário logado
         $user = factory(User::class)->create();

         // DADO que os campos obrigatórios são preenchidos
         // DADO que existe uma TEMPORADA ativa
         // DADO que o deck é do modo PANDORA
         // DADO que o deck tem EXTAMENTE 30 CARTAS
         // DADO que o deck tem EXTAMENTE 3 cartas do tipo TESOURO (diferentes entre si)
         // DADO que o deck não contém a carta 3 DESEJOS
         // DADO que o deck tem no máximo 3 CORES (excluindo-se o NEUTRO)
         $deck = factory(Deck::class)->states('pandora')->make(['user_id' => $user->id]);
         $deck = DeckHelper::build($deck, 'pandora');
         $cartas = $deck->cartas;
         $matchup = $deck->matchup;


         // QUANDO a requisição for processada
         $response = $this->actingAs($user)->post('/decks', $deck->toArray());
        //  dd($response->getContent());

         $deck_id = json_decode($response->getContent())->id;

         unset($deck->cartas);
         unset($deck->matchup);

         // ENTÃO devo visualizar a configuração do deck criado
         $response->assertJsonFragment($deck->toArray());

         $response = $this->actingAs($user, 'api')->get("/decks/{$deck_id}?includes=cartas,matchup.cores,matchup.tipos");
         $data = (object) json_decode($response->getContent());

         // E as CARTAS associadas
         $cartas2 = json_encode(collect($data->cartas)->map(function ($item, $key) {
             return ['id' => $item->id, 'total' => $item->total];
         }));

         $cartas = json_encode($cartas);

         $this->assertEquals($cartas, $cartas2);
         // E EXATAMENTE 30 CARTAS

         $this->assertEquals(30, collect($data->cartas)->pluck('total')->sum());
         // E EXATAMENTE 3 TESOUROS (diferentes entre si)
         $this->assertEquals(3, collect($data->cartas)->where('metadata.color', 'PANDORA')->pluck('total')->sum());
         $this->assertEquals(1, collect($data->cartas)->where('metadata.color', 'PANDORA')->pluck('total')->max());
         // E o deck não contém a carta 3 DESEJOS
         $this->assertEquals(0, collect($data->cartas)->where('metadata.card_id', '350')->count());
     }

     /*
      * DADO que sou um usuário logado
      * DADO que os campos obrigatórios são preenchidos
      * DADO que o deck é do modo PANDORA
      * DADO que o deck tem 4 cores (excluindo-se o NEUTRO)
      * QUANDO a requisição for processada
      * ENTÃO devo visualizar uma mensagem de erro
      */

     public function test_criar_deck_invalido_4_cores()
     {
         // DADO que sou um usuário logado
         $user = factory(User::class)->create();

         // DADO que os campos obrigatórios são preenchidos
         // DADO que o deck é do modo PANDORA
         // DADO que o deck tem 4 CORES
         $deck = factory(Deck::class)->states('pandora')->make(['user_id' => $user->id]);
         $deck = DeckHelper::build($deck, 'pandora_4_cores');

         // QUANDO a requisição for processada
         $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());
        //  dd($response->getContent());
        //  dd(collect($data->cartas)->pluck('metadata.color')->unique());

         // ENTÃO devo visualizar uma mensagem de erro
         $response->assertJsonFragment(['message' => 'Uma matchup PANDORA deve conter no máximo 3 cores']);
     }


     /*
      * DADO que sou um usuário logado
      * DADO que os campos obrigatórios são preenchidos
      * DADO que o deck é do modo PANDORA
      * DADO que o deck NÃO EXATAMENTE 3 TESOUROS (diferentes entre si)
      * QUANDO a requisição for processada
      * ENTÃO devo visualizar uma mensagem de erro
      */

     public function test_criar_deck_invalido_3_tesouros_diferentes()
     {
         // DADO que sou um usuário logado
         $user = factory(User::class)->create();

         // DADO que sou um usuário logado
         // DADO que os campos obrigatórios são preenchidos
         // DADO que o deck é do modo PANDORA
         // DADO que o deck NÃO EXATAMENTE 3 TESOUROS (diferentes entre si)
         $deck = factory(Deck::class)->states('pandora')->make(['user_id' => $user->id]);
         $deck = DeckHelper::build($deck, 'nao_tem_3_tesouros_diferentes');

         // QUANDO a requisição for processada
         $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());

         // ENTÃO devo visualizar uma mensagem de erro
         $response->assertJsonFragment(['message' => 'Um deck PANDORA deve conter exatamente 3 tesouros diferentes entre si']);
     }

     /*
      * DADO que sou um usuário logado
      * DADO que os campos obrigatórios são preenchidos
      * DADO que o deck é do modo PANDORA
      * DADO que o deck CONTÉM a carta 3 DESEJOS
      * QUANDO a requisição for processada
      * ENTÃO devo visualizar uma mensagem de erro
      */

     public function test_criar_deck_invalido_com_3_desejos()
     {
         // DADO que sou um usuário logado
         $user = factory(User::class)->create();

         // DADO que sou um usuário logado
         // DADO que os campos obrigatórios são preenchidos
         // DADO que o deck é do modo PANDORA
         // DADO que o deck CONTÉM a carta 3 DESEJOS
         $deck = factory(Deck::class)->states('pandora')->make(['user_id' => $user->id]);
         $deck = DeckHelper::build($deck, 'pandora_com_3_desejos');

         // QUANDO a requisição for processada
         $response = $this->actingAs($user, 'api')->post('/decks', $deck->toArray());

         // ENTÃO devo visualizar uma mensagem de erro
         $response->assertJsonFragment(['message' => 'A carta 3 DESEJOS não é permitida no MODO PANDORA']);
     }
}

<?php

namespace Tests\Feature;

use App;
use Faker;
use App\User;
use App\Deck;
use App\Partida;
use App\Temporada;
use Tests\DeckCase;
use Tests\DeckHelper;
use Tests\PartidaHelper;

class PartidaTest extends DeckCase
{

 /* DADO que tenho um DECK registrado
  * DADO que eu informei o MATCHUP DO OPONENTE (ARQUETIPO, CORES, TIPO - se houver)
  * DADO que informei se GANHEI ou PERDI
  * DADO que informei se SE JOGUEI PRIMEIRO ou DEPOIS
  * QUANDO a requisição for processada
  * ENTÃO devo visualizar a estatística GERAL do usuário atualizada
  * ENTÃO devo visualizar a estatística GERAL do deck atualizada
  */

  public function test_atualizar_estatisticas_todas_temporadas()
  {

   /* DADO que tenho um DECK registrado
    * DADO que eu informei o MATCHUP DO OPONENTE (ARQUETIPO, CORES, TIPO - se houver)
    * DADO que informei se GANHEI ou PERDI
    * DADO que informei se SE JOGUEI PRIMEIRO ou DEPOIS
    */
      $user = factory(User::class)->create();

      $deck1 = factory(Deck::class)->states('batalha')->create(['user_id' => $user->id]);
      $deck2 = factory(Deck::class)->states('batalha')->create(['user_id' => $user->id]);
      $deck3 = factory(Deck::class)->states('pandora')->create(['user_id' => $user->id]);
      $deck4 = factory(Deck::class)->states('pandora')->create(['user_id' => $user->id]);
      $partida1 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => 1]);
      $partida2 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => -1]);
      $partida3 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => -1]);
      $partida4 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck2->id, 'evento' => 1]);
      $partida5 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck2->id, 'evento' => 1]);
      $partida6 = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck3->id, 'evento' => 1]);
      $partida7 = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck4->id, 'evento' => 1]);
      $partida1 = PartidaHelper::format($partida1);
      $partida2 = PartidaHelper::format($partida2);
      $partida3 = PartidaHelper::format($partida3);
      $partida4 = PartidaHelper::format($partida4);
      $partida5 = PartidaHelper::format($partida5);
      $partida6 = PartidaHelper::format($partida6);
      $partida7 = PartidaHelper::format($partida7);

      $estatisticasDeck1Geral = [
         'winrate' => 33,
         'vitorias' => 1,
         'derrotas' => 2
      ];

      $estatisticasDeck2Geral = [
         'winrate' => 100,
         'vitorias' => 2,
         'derrotas' => 0
      ];

      $estatisticasDeck3Geral = [
         'winrate' => 100,
         'vitorias' => 1,
         'derrotas' => 0
      ];

      $estatisticasDeck4Geral = [
         'winrate' => 100,
         'vitorias' => 1,
         'derrotas' => 0
      ];

      $estatisticasUsuarioGeral = [
        'winrate' => 71,
         'vitorias' => 5,
         'derrotas' => 2
      ];

      $estatisticasUsuarioPandoraGeral = [
        'winrate' => 100,
         'vitorias' => 2,
         'derrotas' => 0
      ];

      $estatisticasUsuarioBatalhaGeral = [
        'winrate' => 60,
         'vitorias' => 3,
         'derrotas' => 2
      ];

      // QUANDO a requisição for processada
      $this->actingAs($user, 'api')->post('/partidas', $partida1->toArray());
      $this->actingAs($user, 'api')->post('/partidas', $partida2->toArray());
      $this->actingAs($user, 'api')->post('/partidas', $partida3->toArray());
      $this->actingAs($user, 'api')->post('/partidas', $partida4->toArray());
      $this->actingAs($user, 'api')->post('/partidas', $partida5->toArray());
      $this->actingAs($user, 'api')->post('/partidas', $partida6->toArray());
      $this->actingAs($user, 'api')->post('/partidas', $partida7->toArray());

      // dd($response->getContent());

      $responseDeck1 = $this->actingAs($user, 'api')->get("/decks/{$deck1->id}?temporada=todas");
      $responseDeck2 = $this->actingAs($user, 'api')->get("/decks/{$deck2->id}?temporada=todas");
      $responseDeck3 = $this->actingAs($user, 'api')->get("/decks/{$deck3->id}?temporada=todas");
      $responseDeck4 = $this->actingAs($user, 'api')->get("/decks/{$deck4->id}?temporada=todas");

      $responseUser = $this->actingAs($user, 'api')->get("/users/{$user->id}?appends=estatisticas&temporada=todas");

      // ENTÃO devo visualizar a estatística GERAL do deck atualizada
      $responseDeck2->assertJsonFragment($estatisticasDeck2Geral);
      $responseDeck3->assertJsonFragment($estatisticasDeck3Geral);
      $responseDeck4->assertJsonFragment($estatisticasDeck4Geral);

      // // ENTÃO devo visualizar a estatística GERAL do usuário atualizada
      $responseUser->assertJsonFragment($estatisticasUsuarioGeral);
      $responseUser->assertJsonFragment($estatisticasUsuarioPandoraGeral);
      $responseUser->assertJsonFragment($estatisticasUsuarioBatalhaGeral);
  }


  /* DADO que tenho um DECK registrado
   * DADO que eu informei o MATCHUP DO OPONENTE (ARQUETIPO, CORES, TIPO - se houver)
   * DADO que informei se GANHEI ou PERDI
   * DADO que informei se SE JOGUEI PRIMEIRO ou DEPOIS
   * QUANDO a requisição for processada
   * ENTÃO devo visualizar a estatística GERAL do usuário atualizada
   * ENTÃO devo visualizar a estatística GERAL do deck atualizada
   */

   public function test_atualizar_estatisticas_temporada_contexto()
   {

    /* DADO que tenho um DECK registrado
     * DADO que eu informei o MATCHUP DO OPONENTE (ARQUETIPO, CORES, TIPO - se houver)
     * DADO que informei se GANHEI ou PERDI
     * DADO que informei se SE JOGUEI PRIMEIRO ou DEPOIS
     */
       $user = factory(User::class)->create();

       $deck1 = factory(Deck::class)->states('batalha')->create(['user_id' => $user->id]);
       $deck2 = factory(Deck::class)->states('pandora')->create(['user_id' => $user->id]);


       $partida1 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => 1]);
       $partida2 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => -1]);
       $partida3 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => -1]);
       $partida4 = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck2->id, 'evento' => 1]);
       $partida5 = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck2->id, 'evento' => 1]);


       $partida1 = PartidaHelper::format($partida1);
       $partida2 = PartidaHelper::format($partida2);
       $partida3 = PartidaHelper::format($partida3);
       $partida4 = PartidaHelper::format($partida4);
       $partida5 = PartidaHelper::format($partida5);

       $this->actingAs($user, 'api')->post('/partidas', $partida1->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida2->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida3->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida4->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida5->toArray());

       $this->actingAs($user, 'api')->post('/temporadas/encerrar');

       $partida1 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => 1]);
       $partida2 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => 1]);
       $partida3 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => -1]);
       $partida4 = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck2->id, 'evento' => -1]);
       $partida5 = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck2->id, 'evento' => 1]);

       $partida1 = PartidaHelper::format($partida1);
       $partida2 = PartidaHelper::format($partida2);
       $partida3 = PartidaHelper::format($partida3);
       $partida4 = PartidaHelper::format($partida4);
       $partida5 = PartidaHelper::format($partida5);


       $this->actingAs($user, 'api')->post('/partidas', $partida1->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida2->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida3->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida4->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida5->toArray());


       $this->actingAs($user, 'api')->post('/temporadas/encerrar');

       $partida1 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => 1]);
       $partida2 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => -1]);
       $partida3 = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck1->id, 'evento' => -1]);
       $partida4 = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck2->id, 'evento' => -1]);
       $partida5 = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck2->id, 'evento' => -1]);

       $partida1 = PartidaHelper::format($partida1);
       $partida2 = PartidaHelper::format($partida2);
       $partida3 = PartidaHelper::format($partida3);
       $partida4 = PartidaHelper::format($partida4);
       $partida5 = PartidaHelper::format($partida5);

       $this->actingAs($user, 'api')->post('/partidas', $partida1->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida2->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida3->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida4->toArray());
       $this->actingAs($user, 'api')->post('/partidas', $partida5->toArray());


       $estatisticasDeck1Atual = [
          'winrate' => 33,
          'vitorias' => 1,
          'derrotas' => 2
       ];

       $estatisticasDeck1Anterior = [
          'winrate' => 67,
          'vitorias' => 2,
          'derrotas' => 1
       ];

       $estatisticasDeck1Todas = [
          'winrate' => 44,
          'vitorias' => 4,
          'derrotas' => 5
       ];



       $estatisticasDeck2Atual = [
          'winrate' => 0,
          'vitorias' => 0,
          'derrotas' => 2
       ];

       $estatisticasDeck2Anterior = [
          'winrate' => 50,
          'vitorias' => 1,
          'derrotas' => 1
       ];

       $estatisticasDeck2Todas = [
          'winrate' => 50,
          'vitorias' => 3,
          'derrotas' => 3
       ];

       $estatisticasUsuarioAtual = [
         'winrate' => 20,
          'vitorias' => 1,
          'derrotas' => 4
       ];

       $estatisticasUsuarioPandoraAtual = [
          'vitorias' => 0,
          'derrotas' => 2,
          'winrate' => 0
       ];

       $estatisticasUsuarioBatalhaAtual = [
         'winrate' => 33,
          'vitorias' => 1,
          'derrotas' => 2
       ];


       $estatisticasUsuarioAnterior = [
         'winrate' => 60,
          'vitorias' => 3,
          'derrotas' => 2
       ];

       $estatisticasUsuarioPandoraAnterior = [
         'winrate' => 50,
          'vitorias' => 1,
          'derrotas' => 1
       ];

       $estatisticasUsuarioBatalhaAnterior = [
         'winrate' => 67,
          'vitorias' => 2,
          'derrotas' => 1
       ];


       $estatisticasUsuarioTodas = [
         'winrate' => 47,
          'vitorias' => 7,
          'derrotas' => 8
       ];

       $estatisticasUsuarioPandoraTodas = [
         'winrate' => 50,
          'vitorias' => 3,
          'derrotas' => 3
       ];

       $estatisticasUsuarioBatalhaTodas = [
         'winrate' => 44,
          'vitorias' => 4,
          'derrotas' => 5
       ];


       $responseDeck1Atual = $this->actingAs($user, 'api')->get("/decks/{$deck1->id}?temporada=atual");
       $responseDeck1Anterior = $this->actingAs($user, 'api')->get("/decks/{$deck1->id}?temporada=anterior");
       $responseDeck1Todas = $this->actingAs($user, 'api')->get("/decks/{$deck1->id}?temporada=todas");

       $responseDeck2Atual = $this->actingAs($user, 'api')->get("/decks/{$deck2->id}?temporada=atual");
       $responseDeck2Anterior = $this->actingAs($user, 'api')->get("/decks/{$deck2->id}?temporada=anterior");
       $responseDeck2Todas = $this->actingAs($user, 'api')->get("/decks/{$deck2->id}?temporada=todas");


       $responseUserAtual = $this->actingAs($user, 'api')->get("/users/{$user->id}?appends=estatisticas&temporada=atual");
       $responseUserAnterior = $this->actingAs($user, 'api')->get("/users/{$user->id}?appends=estatisticas&temporada=anterior");
       $responseUserTodas = $this->actingAs($user, 'api')->get("/users/{$user->id}?appends=estatisticas&temporada=todas");

       // ENTÃO devo visualizar a estatística GERAL do deck atualizada
       $responseDeck1Atual->assertJsonFragment($estatisticasDeck1Atual);
       $responseDeck1Anterior->assertJsonFragment($estatisticasDeck1Anterior);
       $responseDeck1Todas->assertJsonFragment($estatisticasDeck1Todas);

       $responseDeck2Atual->assertJsonFragment($estatisticasDeck2Atual);
       $responseDeck2Anterior->assertJsonFragment($estatisticasDeck2Anterior);
       $responseDeck2Todas->assertJsonFragment($estatisticasDeck2Todas);

      //  dd($responseUserAtual->getContent());
       // ENTÃO devo visualizar a estatística GERAL do usuário atualizada
       $responseUserAtual->assertJsonFragment($estatisticasUsuarioAtual);
       $responseUserAtual->assertJsonFragment($estatisticasUsuarioPandoraAtual);
       $responseUserAtual->assertJsonFragment($estatisticasUsuarioBatalhaAtual);


      //  dd($responseUserAnterior->getContent());
       $responseUserAnterior->assertJsonFragment($estatisticasUsuarioAnterior);
       $responseUserAnterior->assertJsonFragment($estatisticasUsuarioPandoraAnterior);
       $responseUserAnterior->assertJsonFragment($estatisticasUsuarioBatalhaAnterior);

       $responseUserTodas->assertJsonFragment($estatisticasUsuarioTodas);
       $responseUserTodas->assertJsonFragment($estatisticasUsuarioPandoraTodas);
       $responseUserTodas->assertJsonFragment($estatisticasUsuarioBatalhaTodas);
   }
}

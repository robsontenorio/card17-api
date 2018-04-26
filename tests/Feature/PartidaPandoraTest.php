<?php

namespace Tests\Feature;

use App;
use App\Deck;
use App\User;
use App\Partida;
use Tests\DeckCase;
use Tests\PartidaHelper;

class PartidaPandoraTest extends DeckCase
{

  // DADO que tenho um deck registrado do modo PANDORA
  // DADO que existe uma TEMPORADA ativa
  // DADO que ainda NÃO encerrei a sequencia de partidas 9V ou 3D) para este deck
  // DADO que eu informei o MATCHUP DO OPONENTE (ARQUÉTIPO E MÁXIMO 3 CORES)
  // DADO que informei se GANHEI ou PERDI
  // DADO que informei se SE JOGUEI PRIMEIRO ou DEPOIS
  // QUANDO a requisição for processada
  // ENTÃO devo visualizar os dados informados
  public function test_criar_partida()
  {
      // DADO que tenho um deck registrado do modo PANDORA
      // DADO que existe uma TEMPORADA ativa
      // DADO que ainda NÃO encerrei a sequencia de partidas  9V ou 3D) para este deck
      // DADO que eu informei o MATCHUP DO OPONENTE (ARQUÉTIPO E MÁXIMO 3 CORES)
      // DADO que informei se GANHEI ou PERDI
      // DADO que informei se SE JOGUEI PRIMEIRO ou DEPOIS
      $user = factory(User::class)->create();
      $deck = factory(Deck::class)->states('pandora')->create(['user_id' => $user->id]);
      $partida = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck->id]);
      $partida = PartidaHelper::format($partida);

      // QUANDO a requisição for processada
      $response = $this->actingAs($user, 'api')->post('/partidas', $partida->toArray());
      // dd($response->getContent());

      $partida_id = json_decode($response->getContent())->id;

      $response = $this->actingAs($user, 'api')->get("/partidas/{$partida_id}");

      unset($partida->matchup);

      // ENTÃO devo visualizar os dados informados
      $response->assertJsonFragment($partida->toArray());
  }


  // DADO que sou um usuário logado
  // DADO que tenho um deck registrado do modo PANDORA
  // DADO que informei a matchup do oponente com 4 CORES
  // QUANDO a requisição for processada
  // ENTÃO devo visualizar uma mensagem de erro
  public function test_criar_partida_com_4_cores()
  {
      // DADO que sou um usuário logado
    // DADO que tenho um deck registrado do modo PANDORA
    // DADO que informei a matchup do oponente com 4 CORES
    // QUANDO a requisição for processada
    // ENTÃO devo visualizar uma mensagem de erro
      $user = factory(User::class)->create();
      $deck = factory(Deck::class)->states('pandora')->create(['user_id' => $user->id]);
      $partida = factory(Partida::class)->states('pandora', '4_cores')->make(['deck_id' => $deck->id]);
      $partida = PartidaHelper::format($partida);

      // dd($partida->matchup->cores);

      // QUANDO a requisição for processada
      $response = $this->actingAs($user, 'api')->post('/partidas', $partida->toArray());

      // ENTÃO devo visualizar uma mensagem de erro
      $response->assertJsonFragment(['message' => 'Uma matchup PANDORA deve conter no máximo 3 cores']);
  }

  // DADO que sou um usuário logado
  // DADO que tenho um deck registrado do modo PANDORA
  // DADO que JÁ encerrei a sequencia de partidas 9V ou 3D) para este deck
  // QUANDO a requisição for processada
  // ENTÃO devo visualizar uma mensagem de erro
  public function test_criar_partida_com_sequencia_encerrada()
  {

    // DADO que sou um usuário logado
    // DADO que tenho um deck registrado do modo PANDORA
    // DADO que JÁ encerrei a sequencia de partidas 9V ou 3D) para este deck
      $user = factory(User::class)->create();

      $deck = factory(Deck::class)->states('pandora')->create(['user_id' => $user->id]);
      $partidas = factory(Partida::class, 9)->states('pandora')->create(['deck_id' => $deck->id, 'evento' => 1 ]);

      $partida = factory(Partida::class)->states('pandora')->make(['deck_id' => $deck->id, 'evento' => 1 ]);

      // QUANDO a requisição for processada
      $response = $this->actingAs($user, 'api')->post('/partidas', $partida->toArray());

      //dd($response->getContent());
      // ENTÃO devo visualizar uma mensagem de erro
      $response->assertJsonFragment(['message' => 'Jornada PANDORA encerrada']);
  }
}

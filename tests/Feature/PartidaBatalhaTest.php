<?php

namespace Tests\Feature;

use App;
use App\Deck;
use App\User;
use App\Partida;
use Tests\DeckCase;
use Tests\PartidaHelper;

class PartidaBatalhaTest extends DeckCase
{

  // DADO que tenho um deck registrado do modo BATALHA
  // DADO que existe uma TEMPORADA ativa
  // DADO que eu informei o MATCHUP DO OPONENTE (ARQUETIPO, CORES, TIPO - se houver)
  // DADO que informei se GANHEI ou PERDI
  // DADO que informei se SE JOGUEI PRIMEIRO ou DEPOIS
  // QUANDO a requisição for processada
  // ENTÃO devo visualizar os dados informados
  public function test_criar_partida()
  {
      // DADO que sou um usuário logado
      // DADO que existe uma TEMPORADA ativa
      // DADO que tenho um deck registrado do modo BATALHA
      // DADO que eu informei o MATCHUP DO OPONENTE (ARQUETIPO, CORES, TIPO - se houver)
      // DADO que informei se GANHEI ou PERDI
      // DADO que informei se SE JOGUEI PRIMEIRO ou DEPOIS
      $user = factory(User::class)->create();
      $deck = factory(Deck::class)->states('batalha')->create(['user_id' => $user->id]);
      $partida = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck->id]);
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
  // DADO que tenho um deck registrado do modo BATALHA
  // DADO que eu informei o MATCHUP DO OPONENTE sem informar a cor
  // QUANDO a requisição for processada
  // ENTÃO devo visualizar a mensagem de erro
  public function test_criar_sem_cor()
  {
      // DADO que sou um usuário logado
      // DADO que tenho um deck registrado do modo BATALHA
      // DADO que eu informei o MATCHUP DO OPONENTE sem informar a cor
      $user = factory(User::class)->create();
      $deck = factory(Deck::class)->states('batalha')->create(['user_id' => $user->id]);
      $partida = factory(Partida::class)->states('batalha', 'sem_cores')->make(['deck_id' => $deck->id]);
      $partida = PartidaHelper::format($partida);


      // QUANDO a requisição for processada
      $response = $this->actingAs($user, 'api')->post('/partidas', $partida->toArray());

      // ENTÃO devo visualizar a mensagem de erro
      $response->assertJsonFragment(['message' => 'Selecione pelo menos uma cor']);
  }


  // DADO que sou um usuario logado
  // DADO que a partida pertence a um dos meus decks
  // QUANDO a requisição for processada
  // ENTÃO devo visualizar os dados da partida excluida
  public function test_excluir_partida()
  {
      // DADO que sou um usuário logado
      $user = factory(User::class)->create();
      // DADO que a partida pertence a um dos meus decks
      $deck = factory(Deck::class)->states('batalha')->create(['user_id' => $user->id]);
      $partida = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck->id]);
      $partida = PartidaHelper::format($partida);

      $response = $this->actingAs($user, 'api')->post('/partidas', $partida->toArray());
      // dd($response->getContent());
      $partida_id = json_decode($response->getContent())->id;

      // QUANDO a requisição for processada
      $response = $this->actingAs($user, 'api')->delete("/partidas/{$partida_id}", $partida->toArray());

      // ENTÃO devo visualizar a partida excluida
      $response->assertJsonFragment(['id' => $partida_id]);
  }

  // DADO que sou um usuario logado
  // DADO que a partida NÃO pertence a um dos meus decks
  // QUANDO a requisição for processada
  // ENTÃO devo visualizar uma mensagem de erro
  public function test_excluir_partida_outra_pessoa()
  {
      // DADO que sou um usuário logado
      $user = factory(User::class)->create();
      $outro_user = factory(User::class)->create();

      // DADO que a partida NÃO pertence a um dos meus decks
      $deck = factory(Deck::class)->states('batalha')->create(['user_id' => $user->id]);
      $partida = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck->id]);
      $partida = PartidaHelper::format($partida);

      $response = $this->actingAs($user, 'api')->post('/partidas', $partida->toArray());
      $partida_id = json_decode($response->getContent())->id;

      // QUANDO a requisição for processada
      $response = $this->actingAs($outro_user, 'api')->delete("/partidas/{$partida_id}", $partida->toArray());

      // ENTÃO devo visualizar uma mensagem de erro
      $response->assertJsonFragment(['message' => 'Não autorizado']);
  }

  // DADO que sou um usuario logado
  // DADO que o deck informado não pertence à mim
  // QUANDO a requisição for processada
  // ENTÃO devo visualizar uma mensagem de erro
  public function test_criar_partida_em_deck_de_outra_pessoa()
  {
      // DADO que sou um usuário logado
      $user = factory(User::class)->create();
      $outro_user = factory(User::class)->create();

      // DADO que o deck informado não pertence à mim
      $deck = factory(Deck::class)->states('batalha')->create(['user_id' => $outro_user->id]);
      $partida = factory(Partida::class)->states('batalha')->make(['deck_id' => $deck->id]);

      // QUANDO a requisição for processada
      $response = $this->actingAs($user, 'api')->post("/partidas", $partida->toArray());

      // ENTÃO devo visualizar uma mensagem de erro
      $response->assertJsonFragment(['message' => 'Não autorizado']);
  }
}

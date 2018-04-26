<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/', function () {
    return ';) !';
});

Route::get('.well-known', function () {
    return ';) !';
});

// AUTH JWT

Route::post('/auth/register', 'AuthController@register');
Route::post('/auth/login', 'AuthController@login');
Route::post('/auth/logout', 'AuthController@logout');
Route::get('/auth/user', 'AuthController@user');
Route::get('/auth/refresh', [
        'middleware' => 'jwt.refresh',
        function () {
        }
]);



// ROTAS PRIVADAS

Route::group(['middleware' => ['jwt.auth', 'auth:api']], function () {
    Route::get('decks/importar', 'DeckController@importar');
    Route::post('decks', 'DeckController@post');
    Route::put('decks/{deck}', 'DeckController@put');
    Route::delete('decks/{deck}', 'DeckController@delete');

    Route::post('partidas', 'PartidaController@post');
    Route::delete('partidas/{partida}', 'PartidaController@delete');

    Route::patch('users/{user}', 'UserController@patch');

    Route::post('temporadas/encerrar', 'TemporadaController@post');
    Route::delete('temporadas/{temporada}', 'TemporadaController@delete');
});


// ROTAS PUBLICAS

Route::get('comum/welcome', 'ComumController@welcome');
Route::get('comum/stats', 'ComumController@stats');
Route::get('comum', 'ComumController@listar');
Route::get('comum/importar_cards', 'ComumController@importar_cards');
Route::get('comum/ajustar_matchups', 'ComumController@ajustar_matchups');

Route::get('users', 'UserController@listar');
Route::get('users/{user}', 'UserController@get')->where('user', '[0-9]+');;
Route::get('users/@{username}', 'UserController@slug')->where('username', '^[A-Za-z0-9_-]+$');;


Route::get('decks', 'DeckController@listar');
Route::get('decks/{deck}', 'DeckController@get');
Route::get('partidas/{partida}', 'PartidaController@get');

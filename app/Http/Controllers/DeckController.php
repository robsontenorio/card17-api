<?php

namespace App\Http\Controllers;

use App\Deck;
use Illuminate\Http\Request;

class DeckController extends Controller
{
    public function listar(Request $request)
    {
        return Deck::listar($request->all());
    }

    public function get(Request $request, Deck $deck)
    {
        return Deck::get($deck->id, $request->all());
    }

    public function post(Request $request)
    {
        $deck = new Deck();
        return $deck->fill($request->all())->criar();
    }

    public function put(Request $request, Deck $deck)
    {
        return Deck::findOrFail($deck->id)->fill($request->all())->atualizar();
    }

    public function delete(Deck $deck)
    {
        return Deck::findOrFail($deck->id)->excluir();
    }

    public function importar(Request $request)
    {
        return Deck::importar($request->input('url'));
    }
}

<?php

namespace App\Http\Controllers;

use App\Partida;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PartidaController extends Controller
{
    public function get(Request $request, Partida $partida)
    {
        return Partida::get($partida->id, $request->all());
    }

    public function post(Request $request)
    {
        $partida = new Partida();
        return $partida->fill($request->all())->criar();
    }

    public function put(Request $request, Partida $partida)
    {
        return Partida::findOrFail($partida->id)->fill($request->all())->atualizar();
    }


    public function delete(Partida $partida)
    {
        return Partida::findOrFail($partida->id)->excluir();
    }
}

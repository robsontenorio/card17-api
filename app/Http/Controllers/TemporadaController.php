<?php

namespace App\Http\Controllers;

use App\Temporada;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TemporadaController extends Controller
{
    public function post(Request $request)
    {
        return Temporada::encerrar($request->input('nome'));
    }

    public function delete(Temporada $temporada)
    {
        return Temporada::findOrFail($temporada->id)->excluir();
    }
}

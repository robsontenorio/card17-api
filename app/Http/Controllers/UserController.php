<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function listar(Request $request)
    {
        return User::listar($request->all());
    }

    public function get(Request $request, User $user)
    {
        return User::get($user->id, $request->all());
    }

    public function slug(Request $request, $str)
    {
        $user = User::where('username', $str)->firstOrFail();

        return self::get($request, $user);
    }

    public function patch(Request $request, User $user)
    {
        return $user->fill($request->all())->atualizar();
    }
}

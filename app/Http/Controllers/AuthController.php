<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use JWTAuth;
use Illuminate\Support\Facades\Auth;
use App\User;

class AuthController extends Controller
{
    // protected $jwt;
        //
    // public function __construct(JWTAuth $jwt)
    // {
    //     $this->jwt = $jwt;
    // }

    public function register(Request $request)
    {
        $user = new User();
        $user->fill($request->all());
        $user->password = \Hash::make($request->get('password'));
        $this->validate($request, $user->getRules());
        $user->save();
        return response([
                'status' => 'success',
                'data' => $user
        ], 200);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        if (! $token = JWTAuth::attempt($credentials)) {
            return response([
                    'status' => 'error',
                    'error' => __('Usuário ou senha inválido'),
                    'msg' => 'Usuário/Senha inválidos'
            ], 400);
        }

        return response([
                'status' => 'success'
        ])->header('Authorization', $token);
    }

    public function logout()
    {
        JWTAuth::invalidate(JWTAuth::getToken());

        return response([
                'status' => 'success',
                'msg' => 'Logged out Successfully.'
        ], 200);
    }

    public function user(Request $request)
    {
        // sleep(2);
        return response([
                'status' => 'success',
                'data' => Auth::user()
        ]);
    }
}

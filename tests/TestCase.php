<?php

namespace Tests;

use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Foundation\Testing\TestCase as BaseTestCase;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tymon\JWTAuth\Facades\JWTAuth;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;
    use DatabaseTransactions;

    public function actingAs(Authenticatable $user, $driver = null)
    {
        $this->user = $user;
        return $this;
    }

    public function call($method, $uri, $parameters = [], $cookies = [], $files = [], $server = [], $content = null)
    {
        if ($this->user) {
            $server['HTTP_AUTHORIZATION'] = 'Bearer ' . JWTAuth::fromUser($this->user);
        }

        $server['HTTP_ACCEPT'] = 'application/json';
        return parent::call($method, $uri, $parameters, $cookies, $files, $server, $content);
    }
}

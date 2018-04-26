<?php

namespace App\Providers;

use App\Deck;
use App\Carta;
use App\Partida;
use App\Matchup;
use App\Temporada;
use App\Policies\DeckPolicy;
use App\Policies\CartaPolicy;
use App\Policies\PartidaPolicy;
use App\Policies\MatchupPolicy;
use App\Policies\TemporadaPolicy;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
        Matchup::class => MatchupPolicy::class,
        Partida::class => PartidaPolicy::class,
        Deck::class => DeckPolicy::class,
        Carta::class => CartaPolicy::class,
        Temporada::class => TemporadaPolicy::class
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        // $this->app['auth']->viaRequest('api', function ($request) {
        //     return User::where('email', $request->input('email'))->first();
        // });
    }
}

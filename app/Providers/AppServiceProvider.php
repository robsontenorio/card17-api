<?php

namespace App\Providers;

use App\User;
use App\Deck;
use App\Partida;
use App\Temporada;
use App\Observers\UserObserver;
use App\Observers\DeckObserver;
use App\Observers\PartidaObserver;
use App\Observers\TemporadaObserver;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Partida::observe(PartidaObserver::class);
        User::observe(UserObserver::class);
        Temporada::observe(TemporadaObserver::class);
        Deck::observe(DeckObserver::class);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}

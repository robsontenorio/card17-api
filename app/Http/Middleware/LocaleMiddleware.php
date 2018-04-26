<?php namespace App\Http\Middleware;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;

class LocaleMiddleware
{
    public function handle($request, \Closure $next)
    {
        $user = Auth::user();

        $locale = $request->input('locale', 'en');

        $locale = File::exists(base_path("resources/lang/{$locale}.json")) ? $locale : 'en';

        $locale = ($user) ? $user->locale : $locale;
        app()->setLocale($locale);

        return $next($request);
    }
}

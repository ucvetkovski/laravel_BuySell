<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Log;

class UserMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (session()->has('user')) {
            if (session()->get('user')) {
                Log::channel('log')->info("Request made:", [
                    'id_user' => session()->get('user')->id_user,
                    'request_url' => $request->fullUrl(),
                    'request_method' => $request->method(),
                ]);
                return $next($request);
            }
        }
        return redirect(url('/'));
    }
}

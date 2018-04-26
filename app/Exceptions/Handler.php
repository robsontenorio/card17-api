<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that should not be reported.
     *
     * @var array
     */
    protected $dontReport = [
        \Illuminate\Auth\AuthenticationException::class,
        \Illuminate\Auth\Access\AuthorizationException::class,
        \Symfony\Component\HttpKernel\Exception\HttpException::class,
        \Illuminate\Database\Eloquent\ModelNotFoundException::class,
        \Illuminate\Session\TokenMismatchException::class,
        \Illuminate\Validation\ValidationException::class,
    ];

    /**
     * Report or log an exception.
     *
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param  \Exception  $exception
     * @return void
     */
    public function report(Exception $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $e)
    {
        // return parent::render($request, $exception);

        $erros = [];
        $mensagem = $e->getMessage();
        $trace = $e->getTraceAsString();
        $codigo = method_exists($e, 'getStatusCode') ? $e->getStatusCode() : 499;

        if ($e instanceof ValidationException) {
            $erros = $e->validator->errors()->all();
            $mensagem = 'Oops!';
            $codigo = 422;
        }

        if ($e instanceof NotFoundHttpException) {
            $codigo = 404;
            $mensagem = 'Endpoint não encontrado - '.$request->getUri();
        }

        if ($e instanceof ModelNotFoundException) {
            $codigo = 404;
            $mensagem = 'Registro não encontrado';
        }

        if ($e instanceof MethodNotAllowedHttpException) {
            $codigo = 405;
            $mensagem = 'Método não permitido -' . $request->method();
        }

        if ($e instanceof AuthenticationException) {
            $codigo = 401;
            $mensagem = 'não autenticado';
        }

        if ($request->method() == 'OPTIONS') {
            $codigo = 200;
            $mensagem = 'OPTIONS não implementado';
        }

        $data['code'] = $codigo;
        $data['message'] = $mensagem;

        $data['errors'] = $erros;
        $data['trace'] = $trace;


        return response()->json($data, $codigo);
    }
}

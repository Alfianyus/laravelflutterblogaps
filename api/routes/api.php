<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/posts', [App\Http\Controllers\PostController::class, 'index']);

Route::group(['prefix' =>'admin', 'middleware' =>'auth:admins'], function(){
    Route::post('/post', [App\Http\Controllers\PostController::class, 'store']);
});

Route::get('/test', function(){
    return response([
        'message' => 'Blog Api',
    ]);
});

Route::post('/login', [App\Http\Controllers\Auth\AdminController::class, 'login']);

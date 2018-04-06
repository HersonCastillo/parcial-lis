<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/
/*********************************** Ruta raiz **********************************************************/
Route::get('login', function()
{

	return View::make('inicio');
});

Route::get('inicioProductos', function()
{

	return View::make('iniProduc');
});
Route::get('verProductos', function()
{

	return View::make('verProduc');
});
Route::get('modificarProductos', function()
{

	return View::make('modProduc');
});
?>
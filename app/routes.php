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


Route::post('product/new', array('uses' => 'ProductoController@newProduct' /*, 'before' => 'secure'*/));
Route::post('product/edit/{$id}', array('uses' => 'ProductoController@editProduct'/*, 'before' => 'secure'*/));
Route::post('product/delete/{$id}', array('uses' => 'ProductoController@deleteProduct'/*, 'before' => 'secure'*/));
Route::post('product/products', array('uses' => 'ProductoController@showProduct'/*, 'before' => 'secure'*/));

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
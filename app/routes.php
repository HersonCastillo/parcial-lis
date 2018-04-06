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
Route::get('/', function()
{
	return View::make('form_login');
});
Route::get('ingresar', function()
{
	return View::make('regst');
});
Route::get('/infouser',array('as'=>'principal_user','uses'=>'UsuarioController@index'));
Route::get('/nuevo_user',array('as'=>'nuevo_user','uses'=>'UsuarioController@Registrar'));

Route::get('/pais',array('as'=>'pais','uses'=>'PaisController@getPaises'));
Route::post('/muni',array('as'=>'muni','uses'=>'PaisController@getMunicipios'));

Route::post('/guardar',array('as'=>'guardar','uses'=>'UsuarioController@Guardar'));
Route::post('/update',array('as'=>'update','uses'=>'UsuarioController@Actualizar'));

Route::get('/editar_user/{id}', array('as'=>'editar_user','uses'=>'UsuarioController@Editar'));
Route::get('/borrar_user/{id}',array('as'=>'borrar_user','uses'=>'UsuarioController@Borrar'));

?>

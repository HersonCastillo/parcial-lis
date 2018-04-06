<?php
	class PersonaController extends BaseController{
		public function registro(){
			$nombre = Input::get('nombre');
			$apellido = Input::get('apellido');
			$edad = Input::get('edad');
			$telefono = Input::get('telefono');
			return View::make('pagina2');
		}
	}
?>
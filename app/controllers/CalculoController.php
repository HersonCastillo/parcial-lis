<?php
	class CalculoController extends BaseController{
		public function calcular(){
			$n1 = Input::get('numero1');
			$n2 = Input::get('numero2');

			$resultado = $n1 + $n2;
			return Redirect::to('home')-> with('msj', 'Calculo realizado exitosamente');

			//return View::make('resultado', array('resultado' => $resultado));
		}
	}
?>
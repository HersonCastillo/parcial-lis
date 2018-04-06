@extends('master')

@section('menu')
	@parent
@stop

@section('contenedor')
<br><br><br>
	<center><h1>Calculo basico</h1></center>
	<br>
	<form action="calcular" method="POST" class="table">
		<center>
			@if(Session::has('msj'))
				<div class="alert alert-dark" role="alert">
				  {{Session::get('msj')}}
				</div>
			@endif
			<table>
				<tr>
					<td><label>Número 1:</label></td>
					<td><input type="number" name="numero1" class="form-control"></td>
				</tr>
				<tr>
					<td><label>Número 2:</label></td>
					<td><input type="number" name="numero2" class="form-control"></td>
				</tr>
			</table>
			<br>
			<input type="submit" name="Enviar" value="Calcular" class="btn btn-large btn-secondary">
		</center>
	</form>
@stop

@section('footer')
	@parent
@stop
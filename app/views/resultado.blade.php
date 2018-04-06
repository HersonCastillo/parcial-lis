@extends('master')

@section('menu')
	@parent
@stop

@section('contenedor')
<br><br><br>
	<center><h1>Resultado</h1>
		<h4>{{$resultado}}</h4>
		<a href="home" class='btn btn-large btn-secondary'>Nuevo calculo</a>
	</center>
	<br>
@stop

@section('footer')
	@parent
@stop
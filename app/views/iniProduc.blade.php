@extends('masterProduc')

@section('menu')
	@parent
@stop

@section('contenedor')
<br><br><br>
	<center><h1>Ingreso productos</h1></center>
	<br>
	<form action="" onsubmit="return false"  method="POST" class="table">
		<center>
			<table>
				<tr>
					<td><input type="text" id="name" name="name" placeholder="Nombre" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="text" id="desc" name="desc" placeholder="Descipcion" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="number" step="0.05" min="0" id="price" name="price" placeholder="Precio" class="form-control"></td>
				</tr>
			</table>
			<br>
			<button type="submit" name="Enviar" id="Enviar" class="btn btn-large btn-secondary">Ingresar</button>
		</center>
	</form>
@stop

@section('footer')
	@parent
@stop
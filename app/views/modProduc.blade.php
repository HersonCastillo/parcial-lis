@extends('masterProduc')

@section('menu')
	@parent
@stop

@section('contenedor')
<br><br><br>
	<center><h1>Modificar productos</h1></center>
	<br>
	<form action="" onsubmit="return false"  method="POST" class="table">
		<center>
		<td><input type="hidden" id="cod" name="cod"></td>
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

@section('code')
	<script type="text/javascript">
		$(document).ready(function(){
			var info = JSON.parse(localStorage.getItem("user-edit"));
			if(info != undefined && info){
				$("#cod").val(info.id);
				$("#name").val(info.nombre);
				$("#desc").val(info.descripcion);
				$("#price").val(info.precio);

				$("#Enviar").click(function(){
					var producto = {
						nombre: $("#name").val(),
						descripcion: $("#desc").val(),
						precio: $("#price").val(),
						id: $("#cod").val()
					}
					$.ajax({
						url: 'product/edit',
						type: 'post',
						data: producto,
						success: function(response){
							if(response.status == "ok") alert(response.message)
							else if(response.status == "error") alert(response.message)
							localStorage.removeItem('user-edit');
							window.location.href = 'modificarProductos';
						}
					});
				})

			}else location.href = 'verProductos';
		});
	</script>
@stop

@section('footer')
	@parent
@stop
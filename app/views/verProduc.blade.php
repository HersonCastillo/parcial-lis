@extends('masterProduc')

@section('menu')
	@parent
@stop

@section('contenedor')
<br><br><br>
	<center><h1>Ver productos</h1></center>
	<table class="table table-bordered">
		<thead>
			<tr>
				<td><b>Nombre</b></td>
				<td><b>Descripcion</b></td>
				<td><b>Precio</b></td>
				<td><b>Acciones</b></td>
			</tr>
		</thead>
		<tbody class="body-table">
		</tbody>
	</table>
	<br>
@stop

@section('code')
	<script>
		$(document).ready(function(){
			$.ajax({url: 'product/products', success: function(response){
				var len = response.length;
				for(var i = 0; i < len; i++){
					$(".body-table").append("<tr> <td>" + response[i].nombre + "</td><td>" + response[i].descripcion + "</td><td>$" + response[i].precio + "</td> <td> <button class='btn btn-danger elim' onclick='eliminar(" + response[i].id + ")'>Eliminar</button><button class='btn btn-warning modi' onclick='modificar(" + response[i].id + ")'>Modificar</button> </td> </tr>");
				}
			}});
		})
		var modificar = function(id){
			
		}
		var eliminar = function(id){
			if(confirm('¿Eliminar este elemento?')){
				$.ajax({
					url: 'product/delete',
					type: 'post',
					data: {
						id: id
					},
					success: function(response){
						$.ajax({url: 'product/products', success: function(response){
							var len = response.length;
							$(".body-table").html('');
							for(var i = 0; i < len; i++){
								$(".body-table").append("<tr> <td>" + response[i].nombre + "</td><td>" + response[i].descripcion + "</td><td>$" + response[i].precio + "</td> <td> <button class='btn btn-danger elim' onclick='eliminar(" + response[i].id + ")'>Eliminar</button><button class='btn btn-warning modi' onclick='modificar(" + response[i].id + ")'>Modificar</button> </td> </tr>");
							}
						}});
					}
				})
			}
		}
	</script>
@stop

@section('footer')
	@parent
@stop
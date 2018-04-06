@extends('master_jasson')
@section('menu')
    @parent
@stop

<script src="https://code.jquery.com/jquery-1.12.1.js" integrity="sha256-VuhDpmsr9xiKwvTIHfYWCIQ84US9WqZsLfR4P7qF6O8=" crossorigin="anonymous">
     </script>
     <script>
         $(document).ready(function (){
    var llenar = function($id){
        $('#municipio').html('');
        $.ajax({url: '/parcial-lis/public/muni',data:{id:$id},type:"post",success: function(response){
            var muni = response.muni.length;
            for(var i =0; i < muni; i++){
                $("#municipio").append("<option value='"+response.muni[i].id+"'>"+response.muni[i].nombre+"</option>")
                }
        }});
    }

    $.ajax({url: '/parcial-lis/public/pais',success: function(response){

        var paises = response.pais.length;
        for(var i =0; i < paises; i++){
            $("#departamento").append("<option value='"+response.pais[i].id+"'>"+response.pais[i].nombre+"</option>")
            }
    }});
    $('#departamento').on('change', function(){
        llenar(this.value);
    });
        llenar(1);
}); 
     </script>   
        
@section('contenedor')
 <br><br><br><br>
 <label class="badge badge-dark"><h3>Editar Usuario</h3></label>
<div class="row">
<form action="{{URL::route('update')}}" method="POST">
<input type="hidden" name="id" id="id" value="{{$info->id}}">
<div class="form-group">
    <label for="nombre">Nombre</label>
    <input type="text" value="{{$info->nombre}}" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
  </div>
  <div class="form-group">
    <label for="username">Username</label>
    <input type="text" class="form-control" value="{{$info->username}}" id="username" name="username" placeholder="Username">
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" value="{{$info->password}}" id="password" name="password" placeholder="Password">
  </div>
    <div class="form-group">
    <select class="form-control" id="departamento" name="departamento">
</select>
    </div>
    <div class="form-group">
    <select class="form-control" id="municipio" name="municipio">
</select>
    </div>
  <button type="submit" class="btn btn-primary">Modificar</button>
</form>
</div>
   
@stop
@section('footer')
    @parent
@stop

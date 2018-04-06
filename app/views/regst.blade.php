@extends('master_jasson')
@section('menu')
    @parent
@stop
@section('contenedor')
<br><br>
<script src="js/jquery-1.11.2.js"></script>
    <script src="js/paises.js"></script>
<div class="row">
<h1>Registro usuario</h1>
</div>
<div class="row">
<div>
<form action="{{URL::route('guardar')}}" method="POST">
<div class="form-group">
    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
  </div>

  <div class="form-group">
    <input type="text" class="form-control" id="username" name="username" placeholder="Username">
  </div>
  <div class="form-group">
    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
  </div>
    <div class="form-group">
    <select class="form-control" id="departamento" name="departamento">
</select>
    </div>
    <div class="form-group">
    <select class="form-control" id="municipio" name="municipio">
</select>
    </div>
  <button type="submit" class="btn btn-primary" name="action">Ingresar</button>
</form>
</div>
</div>
   
@stop

@section('footer')
    @parent
@stop

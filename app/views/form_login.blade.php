@extends('master_jasson')
@section('menu')
    @parent
@stop
@section('contenedor')
<div class="row">
<h1>Login</h1>
</div>
<div class="row">
<div>
<form action="">
<div class="form-group">
    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
  </div>

  <div class="form-group">
    <input type="text" class="form-control" id="username" name="username" placeholder="Username">
  </div>

  <button type="submit" class="btn btn-primary">Ingresar</button>
</form>
</div>
</div>
@stop
@section('footer')
    @parent
@stop

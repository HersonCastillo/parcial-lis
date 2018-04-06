@extends('master_userBlade')
@section('menu')
    @parent
@stop
@section('contenedor')
<a class="waves-effect waves-light btn-small" href="ingresar">Nuevo Registro</a>
    <br><br><br>
    <table class="highlight centered">
            <thead>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Nombre de usuario</th>
                    <th>Contraseña</th>
                    <th>Departamento</th>
                    <th>Municipio</th>
                    <th>Action</th>
            </thead>
            <tbody>
                @foreach($info as $key => $v)
                <tr>
                <td>{{$v->id}}</td>
                <td>{{$v->nombre}}</td>
                <td>
                    {{$v->username}}
                    </td>
                <td>{{$v->password}}</td>
                <td>{{$v->departamentoid}}</td>
                <td>{{$v->municipioid}}</td>
                <td>
                <a class="waves-effect waves-light btn-small" href="{{URL::route('editar_user',array($v->id))}}">Editar</a>
                <a class="waves-effect waves-light btn-small" href="{{URL::route('borrar_user',array($v->id))}}">Borrar</a>
                </td>
                </tr>
                @endforeach

            </tbody>
        </table>
        @stop
@section('footer')
    @parent
@stop

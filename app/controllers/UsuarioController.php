<?php
	class UsuarioController extends BaseController{
        
        public function index(){
            try{
            $ma = DB::table('usuario')->get();
            $datos = array('info'=>$ma);
            return View::make('info',$datos);
            }catch(Exception $ex){
                return console.log($ex->getMessage());
            }

        }

        public function Registrar(){
            return View::make('form_usuario');
        }
        public function Guardar(){
            try{
            $campos = Input::all();
            $datos = array('username'=>$campos['username'],
            'password'=>$campos['password'],
            'nombre'=>$campos['nombre'],
            'departamentoid'=>$campos['departamento'],
            'municipioid'=>$campos['municipio']);
            DB::table('usuario')->insert($datos);
            return Redirect::route('principal_user');

            }catch(Exception $ex){
                return $this->response("error", "Ocurrió un error al guardar los datos: ".$ex->getMessage());
            }
        }

        public function Editar($id){
            $info = DB::table('usuario')->where('id',$id)->first();
            return View::make('form_editar_user', array('info'=>$info));
        }

        public function Actualizar(){
            try{
                $camposEdit = Input::all();
                $datos = array('username'=>$camposEdit['username'],
                'password'=>$camposEdit['password'],
                'nombre'=>$camposEdit['nombre'],
                'departamentoid'=>$camposEdit['departamento'],
                'municipioid'=>$camposEdit['municipio']);
                DB::table('usuario')->where('id',$camposEdit['id'])->update($datos);
                return Redirect::route('principal_user');
            }catch(Exception $ex){
                return $this->response("error", "Ocurrió un error al guardar los datos: ".$ex->getMessage());
                }
        }

        public function Borrar($id){
            DB::table('usuario')->where('id',$id)->delete();
            return Redirect::back();
        }
	}
?>
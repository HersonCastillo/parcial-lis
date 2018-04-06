<?php
    class ProductoController extends BaseController{
        public function newProduct(){
            try{
                $Nombre = Input::get('nombre');
                $Descripcion = Input::get('descripcion');
                $Precio = Input::get('precio');

                $Producto = new Producto();

                $Producto->nombre = $Nombre;
                $Producto->descripcion = $Descripcion;
                $Producto->precio = $Precio;

                $Producto->save();
                return $this->response("ok", "Producto guardado con éxito.");
            }catch(Exception $ex){
                return $this->response("error", "Ocurrió un error: ".$ex->getMessage());
            }
        }
        public function showInfo(){
            try{
                $Id = Input::get('id');
                $Producto = Producto::find($Id);
                return $Producto;
            }catch(Exception $ex){
                return $this->response("error", "Usuario no encontrado.");
            }
        }
        public function editProduct(){
            try{
                $Id = Input::get('id');

                $Nombre = Input::get('nombre');
                $Descripcion = Input::get('descripcion');
                $Precio = Input::get('precio');

                $Producto = Producto::find($Id);
                $Producto->nombre = $Nombre;
                $Producto->descripcion = $Descripcion;
                $Producto->precio = $Precio;

                $Producto->save();
                return $this->response("ok", "Producto modificado con éxito.");
            }catch(Exception $ex){
                return $this->response("error", "Ocurrió un error: ".$ex->getMessage());
            }
        }
        public function deleteProduct(){
            try{
                $Id = Input::get('id');

                $Producto = Producto::find($Id);
                $Producto->delete();
                return $this->response("ok", "Producto eliminado con éxito.");
            }catch(Exception $ex){
                return $this->response("error", "Ocurrió un error: ".$ex->getMessage());
            }
        }
        public function showProduct(){
            return Producto::all();
        }
        private function response($status, $message){
            return array("status" => $status, "message" => $message);
        }
    }
?>
<?php
	class PaisController extends BaseController{
            public function getPaises(){
                try{
                    $ma = DB::table('departamento')->get();
                    $datos = array('pais'=>$ma);
                    return $datos;
                    }catch(Exception $ex){
                        return array('status'=>"error", 'message'=>"Ocurrió un error: ".$ex->getMessage());
                    }
            }
            public function getMunicipios(){
                try{
                    $id = Input::get('id');
                    $ma = DB::table('municipio')->where('iddepartamento',$id)->get();
                    $datos = array('muni'=>$ma);
                    return $datos;
                    }catch(Exception $ex){
                        return array('status'=>"error", 'message'=>"Ocurrió un error: ".$ex->getMessage());
                    }
            }
        }
    ?>
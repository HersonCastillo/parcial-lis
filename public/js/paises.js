$(document).ready(function (){
    var llenar = function($id){
        $('#municipio').html('');
        $.ajax({url: 'muni',data:{id:$id},type:"post",success: function(response){
            var muni = response.muni.length;
            for(var i =0; i < muni; i++){
                $("#municipio").append("<option value='"+response.muni[i].id+"'>"+response.muni[i].nombre+"</option>")
                }
        }});
    }

    $.ajax({url: 'pais',success: function(response){

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
document.querySelector("#btn").addEventListener("click", function(){
    $longitud = 7;
    $clave = generarClave($longitud);
    document.querySelector("#").innerHTML = $clave;
});
function generarClave(long)
{
    let caracteres = "Aa0BbCc1DdEe2FfGgHh3IiJj4KkL15MmNn60oPpQqRr8SsTt9UuVv"WwXxYyZz$",
    clave = '',
    numero;
    for(let i=0;i<long;i++)
    {
        numero = getNumero(0,caracteres.length);
        clave += caracteres.substring(numero, numero + 1);
    }
    return clave;
}
function getNumero(min,max)
{
    return Math.floor(Math.random() * (max - min)) + min;
}

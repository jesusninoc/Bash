#Crear fichero leyendo el nombre desde consola
echo 'Introduzca nombre de fichero'
read fichero
touch $fichero

#Añadir contenido al fichero creado
echo "Hola" > $fichero

#Añadir fecha actual al fichero creado
fecha=`date +%Y/%m/%d-%H:%M`
echo $fecha >> $fichero

#Ver el contenido de un fichero
cat $fichero

#Leer fichero mediante while
while read linea
do
echo $linea
done < $fichero

#Comprobar si un número es menor que 10
numero=11
if [ $numero -ge 10 ]
then
echo "Número mayor que 10"
fi

#Crear un script en el que pida un nombre al usuario y si el nombre es 'pepito' que almacene dicho nombre en un fichero.

read nombre
if [ $nombre == 'pepito' ]
then
echo "Nombre: "$nombre > $nombre.txt
fi

#Recorrer un fichero que tiene nombres de personas y si la persona que está dentro del fichero es 'pepito' almacenar dicho nombre en un fichero.

while read nombre
do
if [ $nombre == 'pepito' ]
then
echo "Nombre: "$nombre > $nombre.txt
fi
done < ficheronombres.txt

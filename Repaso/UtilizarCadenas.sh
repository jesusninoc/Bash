#Contar letras que hay en una palabra
echo $(echo ..... | wc -c)

#Contar palabras
echo $(echo ..... | wc -w)

#Numerar líneas de un fichero
nl /etc/passwd

#Campo 1 de un fichero
cut -f1 -d:

#Mostrar los usuarios seguidos
cut -f1 -d: /etc/passwd | xargs

#Ordenar por un campo
sort -k -t: /etc/passwd

#Buscar un usuario concreto
cat /etc/passwd | grep "usuario"

#Reemplazar el carácter h por el carácter r
echo "hola" | tr 'h' 'r'

#Eliminar un carácter
echo "hola" | tr -d 'a'

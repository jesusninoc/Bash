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

#Reemplazar Pepe por Javier
echo "Hola Pepe" | sed s/Pepe/Javier/g

#Eliminar un carácter
echo "hola" | tr -d 'a'

#Definir donde se van a definir los parámetros mediante xargs
ls | xargs -I ARG echo fichero ARG fichero

#Definir donde se van a definir los parámetros
echo "después" | xargs echo "antes"
echo "antes" | xargs -i echo {} "después"

#Mostrar los parámetros 1 y 2
cat fichero.txt | xargs -l bash -c 'echo this is first:$0 second:$1'

#Asignar permisos leyendo desde un fichero el nombre y el permiso en octal
cat fichero.txt | xargs bash -c 'chmod $0 $1'

#nl numbers the lines in a file
nl fork.c

#fold wraps each line of input text to fit a specified line width
echo "ljalsdjflsjdfljsdsdfj jldjfal adjsdljkjaj d fajd jaj   sjldfljasd asd" | fold -w 15
#break at spaces
echo "ljalsdjflsjdfljsdsdfj jldjfal adjsdljkjaj d fajd jaj   sjldfljasd asd" | fold -w 15 -s

#fmt is a formatter for simplifying and optimizing text files
fmt -w 5 -s fork.c
#reformat only lines beginning with STRING, reattaching the prefix to reformatted lines
fmt -w 5 -s fork.c -p " *"

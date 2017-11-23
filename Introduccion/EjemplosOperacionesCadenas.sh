#Añadir una frase a un fichero
ejemplo='1 Juan Director'
echo $ejemplo > fichero

#Mostrar campos específicos
awk '{print $1,$3;}' fichero

#Contar el número de líneas
wc fichero

#Partir una cadena por un carácter determinado
echo $ejemplo | cut -d ' ' -f3

#Remplazar un carácter por otro dentro de una cadena
echo $ejemplo | tr ' ' ':'

#Imprimir las líneas que contengan coincidencias
echo $ejemplo | grep 'Juan'

#Listar los elementos de una variable
for elemento in `echo $ejemplo`; do $elemento; done

#Dar formato a una fecha
today=`date +%y-%m-%d-%H`
date +"%Y/%m/%d %H:%M"

#Buscar todo los ficheros de la ruta actual
find .

#Buscar cuántas líneas tienen todos los ficheros de la ruta actual
find . | wc -l

#Buscar fichero en todo el sistema
find / -name fichero

#Busca bajo /home todos los archivos que pertenezcan al usuario Mario
find /home -user mario

#Buscar los .txt de los directorios y subdirectorios de la ruta actual
find . -name "*.txt"

#Buscar los .txt de los directorios y subdirectorios de todo el sistema
find / -name "*.txt"
          
#Buscar todos los archivos que hayan cambiado en los últimos 30 minutos
find / -mmin -30 -type f

#Mostrar los archivos que se han accedido a ellos hace menos de 5 minuto
find / -amin -1 2>/dev/null

#Buscar los archivos que tengan más de 100 Mb (en todo el sistema)
find / -size +100M 2>/dev/null

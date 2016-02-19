#Crear un fichero
#Búsquedas básicas
find / -name fichero
#Buscar dentro de una carpeta
#Busca bajo /home todos los archivos que pertenezcan al usuario Mario
find /home -user mario
#Búsquedas a través del tiempo
#Buscar todos los archivos que hayan cambiado en los últimos 30 minutos:
find / -mmin -30 -type f

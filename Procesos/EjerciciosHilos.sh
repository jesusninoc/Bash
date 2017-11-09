#Conocer el PID de un proceso
ps -ef | grep nano

#Ver todos los hilos de los procesos
ps -efL

#Ver información sobre el proceso
cat /proc/(PID)/status

#Seleccionar la información sobre el proceso relacionada con Hilos
cat /proc/(PID)/status | grep Threads

#TODO JUNTO
cat /proc/`pidof icecast2`/status | grep Threads

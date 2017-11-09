#Conocer el PID de un proceso
ps -ef | grep nano

#Averiguar el número de hilos usados por ese proceso.
cat /proc/(PID)/status | grep Threads

#TODO JUNTO
cat /proc/`pidof icecast2`/status | grep Threads

#Programar una tarea cada cinco minutos, la tarea que hay que programas es (crear un log que añada el contenido):

#1. Crear un fichero con el contenido de todos los procesos (toda la información)

#Paso 1: Crear script
ps
date

#Paso 2: Dar permiso al script
chmod u+x todosp.sh

#Paso 3: Añadir al cron para que el script se ejecute cada 5 minutos
crontab -e
*/5 * * * *  /home/kali/todosp.sh > log

#2. Crear un fichero con el contenido de todos los PID de los procesos

#Paso 1: Crear script
ps -o pid

#Paso 2: Dar permiso al script
chmod u+x pids.sh

#Paso 3: Añadir al cron para que el script se ejecute cada 5 minutos
crontab -e
*/5 * * * *  /home/kali/pids.sh > log

#3. Crear un fichero con el contenido del PID del proceso nano (abrir nano)

#Paso 1: Crear script
ps -C nano -o pid=

#Paso 2: Dar permiso al script
chmod u+x pidnano.sh

#Paso 3: Añadir al cron para que el script se ejecute cada 5 minutos
crontab -e
*/5 * * * *  /home/kali/pidnano.sh > log

#4. Comprobar si el hash de un fichero coincide con el que tiene el proceso (no se ha modificado)

#Paso 1: Crear script
proceso=`ps -C nano -o cmd --no-headers`
ruta=`whereis $proceso`
sha512sum $ruta

#Paso 2: Dar permiso al script
chmod u+x sha512.sh

#Paso 3: Añadir al cron para que el script se ejecute cada 5 minutos
crontab -e
*/5 * * * *  /home/kali/sha512.sh > log

#5. Leer de un fichero al que se le van incorporando líneas y extraer de cada línea el sueldo
#Ejemplo de fichero:
#1 Juan Director 1000
#2 Pepe Sistemas 4000
#3 Marta Contabilidad 2000

#Paso 1: Crear script
awk '{print $4}' sueldos

#Paso 2: Dar permiso al script
chmod u+x sueldos.sh

#Paso 3: Añadir al cron para que el script se ejecute cada 5 minutos
crontab -e
*/5 * * * *  /home/kali/sueldos.sh > log

<img src="https://www.redeszone.net/app/uploads/2017/01/Linux-cron-crontab-a%C3%B1adir-tareas-periodicas.png" alt="contrab">


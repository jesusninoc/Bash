#PROCESOS
#Ayuda
#http://www.jesusninoc.com/2015/02/03/mostrar-informacion-sobre-procesos-en-linux-y-windows/

#Mostrar el nombre de los procesos
ps -aux | awk '{print $11}'

#Listado de todos los procesos
nprocesos=`ps -ef | awk '{print $8}'`
for nproceso in $nprocesos
do
echo $nproceso
done

#Extraer el número de ID
ps -ef | grep nano | awk '{print $2}'

procesos=`ps -ef | grep nano | awk '{print $2}' | sort | cut -d ' ' -f1`
echo ${procesos[0]}
echo ${procesos[0]} 
echo $procesos | cut -d ' ' -f1

#Matar el proceso sacando el ID del proceso
kill -9 `pidof apache2`

#Realizar hash a los procesos
IFS=$'\n'
procesos=`ps ax -o command`
for rutap in $procesos
do
echo $rutap
shasum -a 512 $rutap
done

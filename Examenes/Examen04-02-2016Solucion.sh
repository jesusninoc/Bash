#Realizar un programa que permita pedir al usuario un PID de proceso y si es mayor de 5 que se pare el proceso.

echo 'Introduzca PID de proceso que quiere parar: '
read npid
if [ $npid -ge 5 ]
then
echo "PID mayor que 5"
kill -9 $npid
fi

#Realizar un programa que permita pedir al usuario un nombre de proceso y si el PID del proceso es mayor de 5 que se pare.

echo 'Introduzca nombre de proceso que quiere parar: '
read npro
npids=`ps -ef | grep $npro | awk '{print $2}'`
for npid in $npids
do
if [ $npid -ge 5 ]
then
echo $npid
echo "PID mayor que 5"
kill -9 $npid
fi
done


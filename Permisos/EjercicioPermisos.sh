#!/bin/bash

#Crear carpetas para cada asignatura asignado permisos

#######
#PASO 1
#######
#Crear fichero con asignaturas
echo "iso" > asignaturas.txt
echo "xml" >> asignaturas.txt

#Leer fichero con asignaturas con bucle for
for line in $(cat asignaturas.txt)
do
echo $line
done

#Leer fichero con asignaturas con bucle while
while IFS= read -r line
do
echo $line
done < asignaturas.txt

#######
#PASO 2
#######
#Crear fichero con asignaturas + acción (crear)
echo "crear,iso" > asignaturasaccion.txt
echo "crear,xml" >> asignaturasaccion.txt

#Leer fichero con asignaturas + acción con bucle for
for line in $(cat asignaturasaccion.txt)
do
echo $line
done

#Leer fichero con asignaturas + acción y detectar operación de acción
for line in $(cat asignaturasaccion.txt)
do
accion=`echo $line | cut -d "," -f1`
if [ $accion = 'crear' ]
then
echo $line
fi
done

#######
#PASO 3
#######
#Leer fichero con acciones y realizar acción
for line in $(cat asignaturasaccion.txt)
do
accion=`echo $line | cut -d "," -f1`
asignatura=`echo $line | cut -d "," -f2`
if [ $accion = 'crear' ]
then
mkdir $asignatura
fi
done

#######
#PASO 4
#######
#Leer fichero con acciones, realizar acción y asignar permisos
#Crear fichero con asignaturas + acción + permisos
echo "crear,iso,777" > asignaturasaccion.txt
echo "crear,xml,777" >> asignaturasaccion.txt

for line in $(cat asignaturasaccion.txt)
do
accion=`echo $line | cut -d "," -f1`
asignatura=`echo $line | cut -d "," -f2`
permisos=`echo $line | cut -d "," -f3`
if [ $accion = 'crear' ]
then
mkdir $asignatura
chmod $permisos $asignatura
fi
done

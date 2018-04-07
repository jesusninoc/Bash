#!/bin/bash

echo "código" > programa.exe
cat programa.exe
md5sum programa.exe
echo "---------------------"

for file in `ls *.exe`
do
    md5sum $file >> md5resumen
done
cat md5resumen
echo "---------------------"

grep `md5sum programa.exe` md5resumen

echo "código2" >> programa.exe
cat programa.exe
md5sum programa.exe
echo "---------------------"

if grep -q `md5sum programa.exe` md5resumen; then
    echo MD5 no ha cambiado
else
    echo MD5 ha cambiado
fi
echo "---------------------"

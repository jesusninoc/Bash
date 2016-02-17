#Programas instalados Debian
dpkg --get-selections

#Saber si un programa está instalado
dpkg --get-selections | grep 'nano'

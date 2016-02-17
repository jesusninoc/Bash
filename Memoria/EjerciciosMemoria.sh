#Cantidad libre de memoria
memlibre=`free -m|grep Mem|awk '{print $4}'`

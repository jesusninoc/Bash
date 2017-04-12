####################################################################################################################################
####################################################################################################################################
##########################################
##Qué hace esto?
##Par qué te puede servir?
##########################################
####################################################################################################################################
####################################################################################################################################
#Qué hace esto?
ps -ef | grep nano | awk '{print $2}'
####################################################################################################################################
#Qué hace esto?
df -h
sudo fdisk -l
sudo blkid
sudo mkdir mount_name
sudo mount -t auto -v /dev/sdb1 /mnt/mount_name
####################################################################################################################################
#Qué hace esto?
adb shell ip address
####################################################################################################################################
#Qué hace esto?
#Paso 1
proceso=`ps -C nano -o cmd --no-headers`
ruta=`whereis $proceso`
sha512sum $ruta
#Paso 2
chmod u+x sha512.sh
#Paso 3
crontab -e
*/5 * * * *  /home/kali/sha512.sh > log
####################################################################################################################################
#!/bin/bash
 
THRESHOLD=120
ADDRTO="juanito@realmadrid.es"
LOCKFILE="/tmp/acheck.lock"
LOGFILE="/var/log/apache.log"
SERVERIP="192.168.1.1"
 
FREEMEM=`free -m|grep Mem|awk '{print $4}'`
NUMHTTPD=`ps aux | grep apache2 | grep -v "\(root\|grep\)" | wc -l`
echo "`date +'%Y-%m-%d %H:%M:%S %Z'` - ${NUMHTTPD} - ${FREEMEM}" >> ${LOGFILE}
 
if [[ ${NUMHTTPD} -gt ${THRESHOLD} ]]; then
  if [ ! -e "${LOCKFILE}" ]; then
    SUBJECT="Apache Process Check ${SERVERIP}"
    echo "The number of currently running httpd threads is ${NUMHTTPD}, free memory is ${FREEMEM}M." | mail -s "${SUBJECT} - Above Threshold" ${ADDRTO}
    touch ${LOCKFILE}
  fi
else
  if [ -e "${LOCKFILE}" ]; then
    SUBJECT="Apache Process Check ${SERVERIP}"
    rm -f "${LOCKFILE}"
    echo "The number of currently running httpd threads is ${NUMHTTPD}, free memory is ${FREEMEM}M." | mail -s "${SUBJECT} - Below Threshold" ${ADDRTO}
  fi
fi
####################################################################################################################################
#!/bin/bash
 
threshold=90 #percent
total=$(free | grep "Mem:" | awk '{print $2}')
remaining=$(free | grep "Mem:" | awk '{print $4}')
current=$(echo "scale=0;100-$remaining * 100 / $total" | bc -l)
 
if [ $current -gt $threshold ]
then
      /etc/init.d/apache2 stop
      /etc/init.d/mysql restart
      /etc/init.d/apache2 start
 
      echo "Restarted apache and mysql on `date +'%Y-%m-%d %H:%M:%S'`. RAM utilization at {current}%" \
      >> /var/log/apache_mysql_restarter.log
fi
####################################################################################################################################
#!/bin/bash
LOG=/tmp/last_apache_kill.log
NUM=0
NUM=`pidof apache2 | wc -w`
echo "Mueto matao: `date +%Y-%m-%d-%H%M%S`, con $NUM hijos" >> $LOG
kill -9 `pidof apache2`
sleep 2
/etc/init.d/apache2 start
NUM=`pidof apache2 | wc -w`
echo "Esta viivoo: `date +%Y-%m-%d-%H%M%S`, con $NUM hijos" >> $LOG
echo -- >> $LOG
exit 0
####################################################################################################################################
#!/bin/bash
FECHA=`date +%Y_%m_%d-%H%M`
mkdir -p /tmp/backup
OUTFILETHEMES="/tmp/backup/$FECHA.themes.tar"
OUTFILEMODULES="/tmp/backup/$FECHA.modules.tar"
OUTDIR="/opt/backup/"
tar cf $OUTFILETHEMES /var/www/sites/default/themes
tar cf $OUTFILEMODULES /var/www/sites/default/modules

mv $OUTFILETHEMES $OUTDIR
mv $OUTFILEMODULES $OUTDIR
cp /var/www/sites/default/settings.php $OUTDIR$FECHA.settings.php

find $OUTDIR -mtime +21 -delete

exit 0
####################################################################################################################################
#! /bin/bash
rsync -rutv --progress --bwlimit=40000 /srv/files/ /mnt/backup/

mkdir calendario
cd calendario

#Listar números del 1 al 10
echo {1..10}
#Listar números del -10 al 10
echo {-10..10}
#Listar números del 2010 al 2020
echo {2010..2020}
#Listar números del 2010 al 2020 y para cada número listar del 1 al 10
echo {2010..2020}/{1..10}
#Listar números del 2010 al 2020 y para cada número listar los números de los meses del año
echo {2010..2020}/{1..12}
#Listar números del 2010 al 2020 y para cada número listar los nombres de los meses del año
echo {2010..2020}/{Enero,Febrero,Marzo,Abril,Mayo,Junio,Julio,Agosto,Septiembre,Octubre,Noviembre,Diciembre}

#Crear carpetas para los años del 2010 al 2020 y dentro de cada carpeta crear carpetas con todos los meses del año
mkdir -p {2010..2020}/{Enero,Febrero,Marzo,Abril,Mayo,Junio,Julio,Agosto,Septiembre,Octubre,Noviembre,Diciembre}

#Crear carpetas para los años del 2010 al 2020, dentro de cada carpeta del año crear carpetas con todos los meses del año y dentro de cada mes crear 31 carpetas
mkdir -p {2010..2020}/{Enero,Febrero,Marzo,Abril,Mayo,Junio,Julio,Agosto,Septiembre,Octubre,Noviembre,Diciembre}/{1..31}

#Dar formato a fecha
date +"%m-%d-%y"
#Calcular la fecha de un día menos
date --date="1 days ago"
#Calcular la fecha de un día más
date --date="1 days"

#Calcular las fechas para diez días más
for i in {1..10}; do date --date="$i days"; done
#Calcular las fechas para diez días más y diez días menos
for i in {-10..10}; do date --date="$i days"; done

#Listar números del -182 al 182
echo {-182..182}

#Calcular las fechas para 182 días menos y 182 días más
for i in {-182..182}; do date --date="$i days"; done
#Calcular las fechas para 182 días menos y 182 días más dando formato a la fecha
for i in {-182..182}; do date --date="$i days" +"%m\%d\%y"; done

#Crear estructura de directorios
#AÑO -> MESES -> DÍAS
#2017 -> 12 -> 1
mkdir -p `for i in {-182..182}; do date --date="$i days" +"%y/%m/%d"; done`

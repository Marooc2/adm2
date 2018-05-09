nombre <- "Luigui"
apellido <- "Parodi"
Edad <- 24
Direccion <- "Surquillo"
Ingreso<- 2500L
talla<-170
peso<-80
fumador<-FALSE
dni<-48142728

#--- Tipo de variable ---#  

class(nombre)
class(apellido)
class(Edad)
class(Direccion)
class(Ingreso)
class(talla)
class(peso)
class(fumador)
class(dni)

#--- calcular IMC ---#

imc<-peso/(talla^2)
imc

#--- Sala de juego según último digito del DNI ---#

class(as.character(dni))
sala <- substring(as.character(dni),8,8)
sala

#--- Creación de vectores ---#

Nro<-c(1:6)
Nro

Jugador<-c("Lao Gan", "Juan Mercedes","Lucas Li","Monica Llerena","Luis Paredes","Sandra Francois")
Jugador

Clasificacion<-c("A", "A", "B", "A", "C", "B")
Clasificacion

Analitico<-c(TRUE,T,T,T,F,F)
Analitico

Ganancia<-c(4500,4200,4050,3980,3940,3870)
Ganancia

#--- Operaciones ---#

#1:
#--llamar vectores--#
Jugador[2:4]
Jugador[c(1,4)]

poker_vector<-c(140,-50,20,-120,240) 
class(poker_vector)
poker_vector

ruleta_vector<-c(-24,-50,100,-350,10)
class(ruleta_vector)
ruleta_vector    

names(poker_vector)<-c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")
names(poker_vector)

names(ruleta_vector)<-c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")
names(ruleta_vector)

dias<-c("Lu", "Ma", "Mi", "Ju", "Vi")
names(poker_vector)<-dias  
names(ruleta_vector)<-dias

#2
#--¿Cual ha sido la ganancia?--#
Total_Ganancia_S<-sum(poker_vector)
Total_Ganancia_S

Total_Ganancia_S1<-sum(ruleta_vector)
Total_Ganancia_S1

#--Días que se gano BOOL--#
poker_vector>0
#--Mostrar en números--#
poker_vector[poker_vector>0]
#Ganancias totales de Poker y Ruleta#
Total_Semanal_Poker<-sum(poker_vector)
Total_Semana_Ruleta<-sum(ruleta_vector)


#--cantidad total--#
Total_Semana<-Total_Semanal_Poker+Total_Semana_Ruleta
Total_Semana

#Promedio de ganancias por días - ruleta#
promedioR<-mean(ruleta_vector)
promedioR

#Clasificacion#

matriz<-matrix(c(poker_vector, ruleta_vector), ncol=2)
matriz

#-if(matriz<0)>3)
{
  cat("D")
}
if((matriz<0)>2)
{
  cat("C")
}
if((matriz<0)>1)
{
  cat("B")
}
if((matriz>0))
{
  cat("A")
}-#

#--- Tarea ---#

#16. Obtenga en nuevo vector, el porcentaje de ganancia respecto a los 6 mejores jugadores.

  Porcentaje_Ganancia<-c((Ganancia[1:6]/sum(Ganancia[1:6]))*100)
  Porcentaje_Ganancia

#17. Como su jugador está asesorado por Usted que es un analítico, por tanto, diferencie en
      #función de ganancia de los jugadores que son analíticos.  
  cbind(Ganancia,Analitico,Jugador)
#18. Como queremos tener un análisis más fino de nuestros competidores en la semana 2,
    #guardaremos sus ganancias y pérdidas de cada día, las ganancias se encuentran por
    #vectores individuales. Por tanto, construya una matriz. 
  
  Player<-c(1:7)
  Lunes<-c(1500,1200,1200,1050,-200,0,1300)
  Martes<-c(-500,800,1100,1800,2500,1200,900)
  Miercoles<-c(1800,1400,0,350,1720,1400,-180)
  Jueves<-c(650,1100,1150,1200,-300,1300,1050)
  Viernes<-c(2300,900,2400,300,900,700,1300)  
  Total<-c(6750,5400,4850,4700,4620,4600,4370)  
  
  matriz<-matrix(c(Player,Lunes,Martes,Miercoles,Jueves,Viernes,Total), ncol=7)
  matriz
  
#19. Nombre la matriz con las fechas de la semana en las columnas y “Jugador-#” en las filas.
  
  colnames(matriz)<-c("Jugador", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Total")
  rownames(matriz)<-c("Jugador-1", "Jugador-2", "Jugador-3", "Jugador-4","Jugador-5", "Jugador-6", "Jugador-7")
  matriz  
  
#20. Realice el cálculo del Totalizado por Dia  
  
  Total_Lunes<-sum(matriz[,2])
  Total_Lunes 
  
  Total_Martes<-sum(matriz[,3])
  Total_Martes 
  
  Total_Miercoles<-sum(matriz[,4])
  Total_Miercoles
  
  Total_Jueves<-sum(matriz[,5])
  Total_Jueves 
  
  Total_Viernes<-sum(matriz[,6])
  Total_Viernes
  
  Dia_Total<-matrix(c(Total_Lunes,Total_Martes,Total_Miercoles,Total_Jueves,Total_Viernes), ncol=5)
  colnames(Dia_Total)<-c("Total Lunes", "Total Martes", "Total Miercoles", "Total Jueves", "Total Viernes")
  Dia_Total 
  
#21. Realice el cálculo del Totalizado por Jugador
    
  Total_Jugador1<-sum(matriz[1,2:6])
  Total_Jugador1
  
  Total_Jugador2<-sum(matriz[2,2:6])
  Total_Jugador2
  
  Total_Jugador3<-sum(matriz[3,2:6])
  Total_Jugador3
  
  Total_Jugador4<-sum(matriz[4,2:6])
  Total_Jugador4
  
  Total_Jugador5<-sum(matriz[5,2:6])
  Total_Jugador5
  
  Total_Jugador6<-sum(matriz[6,2:6])
  Total_Jugador6
  
  Total_Jugador7<-sum(matriz[7,2:6])
  Total_Jugador7

  Jugador_Total<-matrix(c(Total_Jugador1,Total_Jugador2,Total_Jugador3,Total_Jugador4,Total_Jugador5,Total_Jugador6,Total_Jugador7), ncol=7)
  colnames(Jugador_Total)<-c("Total Jugador 1", "Total Jugador 2", "Total Jugador 3", "Total Jugador 4", "Total Jugador 5", "Total Jugador 6"," Total Jugador 7")
  Jugador_Total 
  
#22. Mientras que el asesor en estrategia de juego le da indicaciones a este empresario para que se prepare para la tercera semana, Usted tabule sus ganancias de la segunda 
     #semana y añada una nueva columna a la matriz adjunta.
  
  Dia<-c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")
  Dia
  
  Gan_Per<-c(300,-50,500,600,300)
  Gan_Per
  
  Ganancia_Perdida <- rbind(Dia,Gan_Per)
  Ganancia_Perdida  

#23. Añada una columna para el totalizado por Dia.
  
  matrizTotalColumna <- cbind(matriz, c(Total_Jugador1,Total_Jugador2,Total_Jugador3,Total_Jugador4,Total_Jugador5,Total_Jugador6,Total_Jugador7))
  colnames(matrizTotalColumna)<-c("Jugador", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Total","TotalDíaColumna")
  rownames(matrizTotalColumna)<-c("Jugador-1", "Jugador-2", "Jugador-3", "Jugador-4","Jugador-5", "Jugador-6", "Jugador-7")
  matrizTotalColumna
  
#24. Añada una fila para el totalizado por Dia
  
  matrizTotalFila<- rbind(matrizTotalColumna, c("Total", Total_Jugador1,Total_Jugador2,Total_Jugador3,Total_Jugador4,Total_Jugador5,Total_Jugador6,Total_Jugador7))
  rownames(matrizTotalFila)<-c("Jugador-1", "Jugador-2", "Jugador-3", "Jugador-4","Jugador-5", "Jugador-6", "Jugador-7","Total Día Fila")
  matrizTotalFila
 
  
#25. Calcule el dinero totalizado de la matriz  
  
  totalizado<-sum(matriz[,7])
  totalizado  
  
#26. Seleccione los resultados del primer Jugador
  
  primer_jugador<-matriz[1,]
  primer_jugador
  
#27. Seleccione los resultados del lunes

 Lunes_res<-matriz[,2]
 Lunes_res
    
#28. Selección los resultados del jugador 2,3,4 en los martes y miércoles.
 
 Data<-matriz[2:4, 3:4]
 Data
 
#29. Calcule el promedio de ingreso de los jugadores 1 al 7.
 
 Promedio1<-mean(matriz[1,2:6])
 Promedio1 
 
 Promedio2<-mean(matriz[2,2:6])
 Promedio2
 
 Promedio3<-mean(matriz[3,2:6])
 Promedio3 
 
 Promedio4<-mean(matriz[4,2:6])
 Promedio4 
 
 Promedio5<-mean(matriz[5,2:6])
 Promedio5 
 
 Promedio6<-mean(matriz[6,2:6])
 Promedio6 
 
 Promedio7<-mean(matriz[7,2:6])
 Promedio7 
 

 TotalPromedio<-mean(sum(Promedio1,Promedio2,Promedio3,Promedio4,Promedio5,Promedio6,Promedio7))
 TotalPromedio
 
#30. Asumiendo que el calculo de puntaje del cliente acumulado se determina por un factor de multiplicación relativo al día.  
 
 porcentaje_acumulado <- c(0.4,0.5,0.6,0.5,0.4)
 
 J1<-matriz[1, 2:6]
 Puntaje_Jugador_1<-sum(porcentaje_acumulado*J1)  
 Puntaje_Jugador_1
 
 J2<-matriz[2, 2:6]
 Puntaje_Jugador_2<-sum(porcentaje_acumulado*J2)  
 Puntaje_Jugador_2
 
 J3<-matriz[3, 2:6]
 Puntaje_Jugador_3<-sum(porcentaje_acumulado*J3)  
 Puntaje_Jugador_3
 
 J4<-matriz[4, 2:6]
 Puntaje_Jugador_4<-sum(porcentaje_acumulado*J4)  
 Puntaje_Jugador_4
 
 J5<-matriz[5, 2:6]
 Puntaje_Jugador_5<-sum(porcentaje_acumulado*J5)  
 Puntaje_Jugador_5
 
 J6<-matriz[6, 2:6]
 Puntaje_Jugador_6<-sum(porcentaje_acumulado*J6)  
 Puntaje_Jugador_6
 
 J7<-matriz[7, 2:6]
 Puntaje_Jugador_7<-sum(porcentaje_acumulado*J7)  
 Puntaje_Jugador_7
  
 Total_Puntaje<-matrix(c(Puntaje_Jugador_1, Puntaje_Jugador_2,Puntaje_Jugador_3, Puntaje_Jugador_4, Puntaje_Jugador_5,Puntaje_Jugador_6,Puntaje_Jugador_7), ncol = 7)
  colnames(Total_Puntaje)<-c("PT J1","PT J2","PT J3","PT J4","PT J5","PT J6","PT J7")
  rownames(Total_Puntaje)<-c("Puntaje Total")
  Total_Puntaje 
  
#31.Si los arreglos de la semana 1 lo convierto a matriz que sucede con lo tipología de Datos
  
  typeof(matriz)
  
  #Contra ejemplo
  
  x <- 1:6
  x  
  typeof(x)
  
  a <-matrix(x)  
  a    
  typeof(a)  
  

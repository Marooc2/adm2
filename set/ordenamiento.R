rm(list=ls())
#######################################################################################
setwd("/home/demo1/Adminfo/parcial2")
getwd()#obtiene la ruta actual
texto = readLines("dataset.txt")
head(texto)#6 primeras lineas  
sum(substr(head(texto), 1, 1)== "#") 

sum(substr(texto, 1, 1) == "#") #suma cantidad de lineas que coincida con la condicion, 
#sirve para extraer las 3 primeras lineas
linea=4#nro de linea para probar
length(texto)#cantidad de registros
strsplit(texto[linea], ";")[[1]]#divide la linea 4 a traves de su caracter separador ";" devuelve como un arreglo de caracteres

terminos = strsplit(texto[linea], "[;=,]")[[1]]

terminos[c(2, 4:6)]#muestra los valores asociados de la fila
terminos[ - ( 1:6 ) ]#toda la linea excepto los 10 primeros valores

temp = matrix(terminos[ - (1:6) ], ncol = 2, byrow = TRUE)#para dividir en columnas los valores de la fila 2

matrix(terminos[c(2, 4:6)], nrow = nrow(temp), ncol = 4, byrow = TRUE)
mat = cbind(matrix(terminos[c(2, 4:6)], nrow = nrow(temp), ncol = 4, byrow = TRUE), temp)#une en varias filas separadas el procesamiento de la fila 4
dim(mat)
#######################################################################################################################################
#Aplicando todo lo anterior a una sola funcion
procesarLinea =function(x)
{
  terminos = strsplit(x, "[;=,]")[[1]]
  if (length(terminos) == 6) 
    return(NULL)
  temp = matrix(terminos[ - (1:6) ], ncol = 2, byrow = TRUE)
  cbind(matrix(terminos[c(2, 4:6)], nrow = nrow(temp),
               ncol = 4, byrow = TRUE), temp)
}
#procesarLinea(texto[1])#comprobando para una linea

################Procesando para todos los logs de la fila 4 a la 20 para comprobar
temp = lapply(texto[4:20], procesarLinea)
sapply(temp, nrow)#cantidad de filas por cada sublista

dataset = as.data.frame(do.call("rbind", temp))#unir todas las sublistas como un solo dataframe
dim(dataset)
#################################################################################################
#aplicando una funcion a todo el dataset

lineas = texto[ substr(texto, 1, 1) != "#" ]#removiendo las lineas que tengan en la primera posicion #
temp = lapply(lineas, procesarLinea)#procesamientode de la funcion en todo el dataset, de tal manera que tenga un dimension uniforme
dataset = as.data.frame(do.call("rbind", temp), stringsAsFactors = FALSE)#convertir una lista a un data frame
write.csv2(file = "generado.csv",x = dataset)#guardar en un csv
dim(dataset)#comprobando dimension uniforme
names(dataset) = c("fecha", "posX", "posY", "posZ", "mac", "senal")

nomVar = c("fecha", "posX", "posY", "posZ", "senal")# note que no seleccionamos el campo MAC

dataset[ nomVar ] =  lapply(dataset[ nomVar ], as.numeric)#convertir estas columnas valores numericos
dataset$fecha = dataset$fecha/1000  #convertir de milisegundos a segundos
class(dataset$fecha) = c("POSIXt", "POSIXct")
View(dataset)


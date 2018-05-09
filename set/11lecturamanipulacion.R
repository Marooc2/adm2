rm(list=ls())
file.path(Sys.getenv("HOME/demo1/Adminfo/ExamenAdm"))
getwd()

##############manipulacion de directorios
if(!dir.exists("datasets"))
  dir.create("datasets")
if(!dir.exists("procesamiento"))
  dir.create("procesamiento")

##############manipulacion de archivos
download.file(url="http://www.unitru.edu.pe/Publicaciones/Admision/2018/orditrujillo.txt", 
              destfile = "orditrujillo.txt")

#file.copy("orditrujillo.txt", to="datasets/")
#file.remove("datasets/orditrujillo.txt")
file.rename("datasets/orditrujillo.txt", "datasets/datos.txt")


###########lectura por lineas
archivo=readLines("datasets/datos.txt")

archivo
NROW(archivo)

head(archivo)

#eliminar espacios en blanco y lineas innecesarias
cadena= "                                               UNIVERSIDAD NACIONAL DE TRUJILLO - UNT"                  
blanco= ""
arreglo=NULL

#preprocesamiento
for(i in 1:NROW(archivo)){
  if(cadena %in% archivo[i]){ 
    arreglo=c(arreglo,(i):(i+7))
  }
  if(blanco %in% archivo[i]){
    arreglo=c(arreglo,i)
  }
}
arreglo

archivo=archivo[-arreglo]

View(archivo)
head(archivo)
tail(archivo)

archivo=archivo[-c(NROW(archivo)-1,NROW(archivo))]
writeLines(archivo,"procesamiento/archivoLimpio.fwf")
archivo1=read.fwf("procesamiento/archivoLimpio.fwf",widths = c(6,7,42,10,8,10,10,26,11))
write.csv(archivo1,"procesamiento/archivo.csv")
View(archivo1)

install.packages("XML")
library("XML")
vacantes=readHTMLTable(doc="http://www.admisionunt.info/vacantes.php", 
                       as.data.frame = T,encoding="UTF-8")
vacantes=vacantes$'NULL'
View(vacantes)










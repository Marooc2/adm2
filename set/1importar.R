#lectura del csv
setwd(dataset)
columnas=c("millas x galon","cilindros","desplazamineto",
           "caballos de fierza","peso","aceleracion",
           "anho modelo","origen","marca")
#por defecto conoce el separador como ,
archivoCSV=read.csv(file = "auto-mpg.csv",header = FALSE,col.names =columnas )

#por defecto conoce el separador como ;
archivoCSV2=read.csv(file = "auto-mpg.csv",header = FALSE,col.names =columnas,sep="," )

archivoCSVT=read.csv(file = "auto-mpg.data.txt",header = FALSE,col.names =columnas,sep="\t" )

View(archivoCSVT)

#lectura
archivoFWF=read.fwf(file="datos.fwf.txt", widths = c(3,8,8))

#lectura de JSON
archivosJSON=fromJSON("estudiantes.json")

#lectura de Excel
archivosExcel1=read_xls("auto-mpg.xls")
archivosExcel2=read_xlsx("auto-mpg.xlsx",col_names = nombres)




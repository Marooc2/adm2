setwd("/home/demo1/Adminfo/parcial")
getwd()
archivo=readLines("datos.txt")
length(archivo)
archivo

dt1=NULL
dt2=NULL
dt3=NULL
dt4=NULL

for(i in 1:(NROW(archivo)/4)){
  dt1[i]=archivo[i*4-3]
  dt2[i]=archivo[i*4-2]
  dt3[i]=archivo[i*4-1]
  dt4[i]=archivo[i*4]
}

writeLines(dt1,"demo1.txt")
writeLines(dt2,"demo2.txt")
writeLines(dt3,"demo3.txt")
writeLines(dt4,"demo4.txt")

dtp1=read.csv("demo1.txt", header = FALSE, sep = ",", col.names = c("1","2","3","4"))
View(dtp1)

dtp2=read.csv("demo2.txt",header = FALSE, sep = ";", col.names = c("1","2","3","4","5"))
View(dtp2)

dtp3=read.csv("demo3.txt",header = FALSE, sep = "|", col.names = c("1","2","3","4","5","6"))
View(dtp3)

dtp4=read.fwf("demo4.txt",header = FALSE,widths = c(1,1,1,1,1,1,1))
View(dtp4)



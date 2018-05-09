install.packages("sqldf")
install.packages("RSQLite")
library(sqldf)
library(RSQLite)
setwd('C:/Consultas')
alumno <- read.csv('alumno.csv')
apoderado <- read.csv('apoderado.csv')
detalle_matricula <- read.csv('detalle_matricula.csv')
grado <- read.csv('grado.csv')
matricula <- read.csv('matricula.csv')
nivel <- read.csv('nivel.csv')
zona <- read.csv('zona.csv')
## 1. Listar la tabla alumno
a <-sqldf (' SELECT * FROM alumno')
data.frame(a)
## 2. Listar la tabla apoderados de los alumnos
b <- sqldf('SELECT * FROM apoderado')
data.frame(b)
## Listar los alumnos con sus respectivos apoderados
c <- sqldf('SELECT a.NOMBRE, a.APELLIDOs, ap.nombre, ap.apellido
 FROM alumno a
 inner join apoderado ap
 ON ap.apoderado_id=a.apoderado_id')
data.frame(c)
##3. cantidad de alumnos del nivel primario
d<-sqldf('SELECT count(nombre)
 FROM alumno a
 inner join matricula m ON m.alumno_id=a.alumno_id
 inner join detalle_matricula d ON d.matricula_id=m.matricula_id
 inner join grado g ON g.grado_id=d.grado_id
 inner join nivel n ON n.nivel_id=g.nivel_id
 WHERE nivel="Primaria"')
data.frame(d)
## 4. Alumnos que viven en departamento de "Ancash" en la provincia de "santa" distrito de
chimbote
e<-sqldf('SELECT nombre,apellidos,departamento, provincia, distrito,direccion
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 inner join zona z
 ON m.zona_id=z.zona_id
 WHERE departamento="Ancash" AND provincia="Santa" AND distrito="Chimbote"')
data.frame(e)
## 5. cantidad de alumnos del nivel secundario
f<-sqldf('SELECT COUNT(nombre)
 FROM alumno a
 inner join matricula m ON m.alumno_id=a.alumno_id
 inner join detalle_matricula d ON d.matricula_id=m.matricula_id
 inner join grado g ON g.grado_id=d.grado_id
 inner join nivel n ON n.nivel_id=g.nivel_id
 WHERE nivel="Secundaria" ')
data.frame(f)
## 6.alumno del nivel inicial cuyos nombres comienzen con la letra "A"
G<- sqldf('SELECT nombre, apellidos, direccion
 FROM alumno a
 inner join matricula m ON m.alumno_id=a.alumno_id
 inner join detalle_matricula d ON d.matricula_id=m.matricula_id
 inner join grado g ON g.grado_id=d.grado_id
 inner join nivel n ON n.nivel_id=g.nivel_id
 where nivel="Inicial" AND nombre LIKE "A%"')
data.frame(G)
##7. REPORTAR DETALLE DE MATRICULA
H<- sqldf('Select * FROM detalle_matricula')
data.frame(H)
## 8. Cantidad de Alumnos que se matricularon en la fecha 27-04-2015 al 19-12-2016
I<-sqldf('SELECT COUNT(nombre)
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 where fecha BETWEEN "20150427" AND "20161219"')
data.frame(I)
# 9. Alumnos que se matricularon en la fecha 27-04-2015 al 19-12-2016 del departamento de
PIURA
j<-sqldf('SELECT a.nombre,a.apellidos, z.departamento
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 inner join zona z ON z.zona_id=m.zona_id
 where fecha BETWEEN "20150427" AND "20161219" AND departamento="Piura"')
data.frame(j)
##10. Cantidad Alumnos que se matricularon en la fecha 27-04-2015 al 19-12-2016 del
departamento de PIURA
k<-sqldf('SELECT COUNT(nombre)
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 inner join zona z ON z.zona_id=m.zona_id
 where fecha BETWEEN "20150427" AND "20161219" AND departamento="Piura"')
data.frame(k)
##11. Alumnos cuyos padres son medicos
l<-sqldf('SELECT a.nombre,a.apellidos
 FROM alumno a inner join apoderado ap
 ON a.apoderado_id=ap.apoderado_id
 where ocupacion="Medico"')
data.frame(l)
# 12. Alumno cuyos nombres comiencen con la letra "A"
alumnos<-sqldf('SELECT nombre, apellidos, direccion
 FROM alumno
 where nombre LIKE "A%"')
data.frame(alumnos)
# 13. Cantidad de alumnos con apellido "Maldonado"
sqldf('SELECT count(apellidos)
 FROM alumno
 where apellidos="Maldonado"')
# 14. Alumnos cuyos padres son Ingenieros
padres_ocupacion<-sqldf('SELECT a.nombre,a.apellidos
 FROM alumno a inner join apoderado ap
 ON a.apoderado_id=ap.apoderado_id
 where ocupacion="Ingeniero"')
data.frame(padres_ocupacion)
# 15. Alumnos que se matricularon en la fecha 27-04-2015 al 19-12-2016
alum_fecha<-sqldf('SELECT a.nombre,a.apellidos
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 where fecha BETWEEN "20150427" AND "20161219"')
data.frame(alum_fecha)
# 16Cantidad de alumnos matriculados en la provincia de "Piura"
sqldf('SELECT count(nombre)
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 inner join zona z
 ON z.zona_id=m.zona_id
 where provincia="Piura"')
# 17. Cantidad de cuotas sin pagar mayores a 3 y menores a 5
sqldf('SELECT count(deuda_cuotas)
 FROM detalle_matricula
 where deuda_cuotas>3 AND deuda_cuotas<5')
# 18. listar alumnos por departamentos
alum_departamento<-sqldf('SELECT a.nombre, z.departamento
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 inner join zona z
 ON m.zona_id=z.zona_id')
data.frame(alum_departamento)
# 19. Alumnos que viven en departamento de "Lima" en la distrito de "Ate"
alum_Lima_Ate<-sqldf('SELECT nombre,apellidos,direccion
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 inner join zona z
 ON m.zona_id=z.zona_id
 WHERE departamento="Lima" AND distrito="Ate"')
data.frame(alum_Lima_Ate)
# 20. cantidad de alumnos en el tercer grado
sqldf('SELECT count(nombre)
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 inner join detalle_matricula d
 ON m.matricula_id=d.matricula_id
 inner join grado g
 ON d.grado_id=g.grado_id
 WHERE grado="Tercero"')
# 21 alumnos que estan en primaria y cursan el tercer grado
alum_prim_tercer<-sqldf('SELECT nombre, apellidos
 FROM alumno a inner join matricula m
 ON a.alumno_id=m.alumno_id
 inner join detalle_matricula d
 ON m.matricula_id=d.matricula_id
 inner join grado g
 ON d.grado_id=g.grado_id
 inner join nivel n
 ON g.nivel_id=n.nivel_id
 WHERE grado="Tercero" AND nivel="Primaria"')
data.frame(alum_prim_tercer)

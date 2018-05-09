  rm(list=ls())
  setwd(file.path(Sys.getenv("HOME")))
  dir.create("Caso_Estudiantes")
  setwd(file.path(Sys.getenv("HOME"),"Caso_Estudiantes"))
  getwd()
  
#Manipulacion de Directorios
  if(!dir.exists("datasets"))
    dir.create("datasets")
  
#Instalaciones de paquetes que necesitamos
  paquetes <- c(install.packages("sqldf"), install.packages("RSQLite"))

#Cargamos librerias a usar
  library("sqldf")
  library("RSQLite")
  
#Lectura de archivos csv
  
  Tabla_Campus <- read.csv("datasets/Campus.csv", header = TRUE, sep = ",", col.names = c("ID_Campus", "Sede"))
  View(Tabla_Campus)

  Tabla_Carrera <- read.csv("datasets/Carrera.csv", header = TRUE, sep = ",", col.names = c("ID_Carrera", "Carrera"))
  View(Tabla_Carrera) 
  
  Tabla_Curso <- read.csv("datasets/Curso.csv", header = TRUE, sep = ",", col.names = c("ID_Curso", "Curso"))
  View(Tabla_Curso) 
  
  Tabla_Encuentas <- read.csv("datasets/Encuentas.csv", header = TRUE, sep = ",", col.names = c("ID", "Puntaje", "ID_SeccionE", "ID_FacultadE"))
  View(Tabla_Encuentas) 
  
  Tabla_Facultad <- read.csv("datasets/Facultad.csv", header = TRUE, sep = ",", col.names = c("ID_Facultad", "Facultad", "ID_CarreraF"))
  View(Tabla_Facultad) 
  
  Tabla_Profesor <- read.csv("datasets/Profesor.csv", header = TRUE, sep = ",", col.names = c("ID_Profesor", "Nombre", "Apellido"))
  View(Tabla_Profesor) 
  
  Tabla_Seccion <- read.csv("datasets/Seccion.csv", header = TRUE, sep = ",", col.names = c("ID_Seccion", "Seccion", "ID_ProfesorS", "ID_CursoS", "ID_CampusS"))
  View(Tabla_Seccion) 
  
#a.Puntaje promedio por curso, sección, docente, carrera, facultad, campus.

    Promedio_General <- sqldf('SELECT TC.Curso, TS.Seccion, TP.Nombre, TCAR.Carrera, TF.Facultad, TCA.Sede,
                           AVG(Puntaje) as "Promedio General"
                           FROM Tabla_Encuentas TE
                           INNER JOIN Tabla_Seccion TS ON TS.ID_Seccion = TE.ID_SeccionE
                           INNER JOIN Tabla_Curso TC ON TC.ID_Curso = TS.ID_CursoS
                           INNER JOIN Tabla_Profesor TP ON TP.ID_Profesor = TS.ID_ProfesorS
                           INNER JOIN Tabla_Campus TCA ON TCA.ID_Campus = TS.ID_CampusS
                           INNER JOIN Tabla_Facultad TF ON TF.ID_Facultad = TE.ID_FacultadE
                           INNER JOIN Tabla_Carrera TCAR ON TCAR.ID_Carrera = TF.ID_CarreraF
                           GROUP BY  TC.Curso')
    View(Promedio_General)
  

#b.Puntajes máximos y mínimos por curso, sección, docente y carrera.
    
    Puntajes_Máximos <- sqldf('SELECT TC.Curso, TS.Seccion, TP.Nombre, TCAR.Carrera,
                           MAX(Puntaje) as "Puntaje máximo"
                           FROM Tabla_Encuentas TE
                           INNER JOIN Tabla_Seccion TS ON TS.ID_Seccion = TE.ID_SeccionE
                           INNER JOIN Tabla_Curso TC ON TC.ID_Curso = TS.ID_CursoS
                           INNER JOIN Tabla_Profesor TP ON TP.ID_Profesor = TS.ID_ProfesorS
                           INNER JOIN Tabla_Facultad TF ON TF.ID_Facultad = TE.ID_FacultadE
                           INNER JOIN Tabla_Carrera TCAR ON TCAR.ID_Carrera = TF.ID_CarreraF
                           GROUP BY  TC.Curso')
    View(Puntajes_Máximos)
    
    Puntajes_Mínimo <- sqldf('SELECT TC.Curso, TS.Seccion, TP.Nombre, TCAR.Carrera,
                           MIN(Puntaje) as "Puntaje mínimo"
                           FROM Tabla_Encuentas TE
                           INNER JOIN Tabla_Seccion TS ON TS.ID_Seccion = TE.ID_SeccionE
                           INNER JOIN Tabla_Curso TC ON TC.ID_Curso = TS.ID_CursoS
                           INNER JOIN Tabla_Profesor TP ON TP.ID_Profesor = TS.ID_ProfesorS
                           INNER JOIN Tabla_Facultad TF ON TF.ID_Facultad = TE.ID_FacultadE
                           INNER JOIN Tabla_Carrera TCAR ON TCAR.ID_Carrera = TF.ID_CarreraF
                           GROUP BY  TC.Curso')
    View(Puntajes_Mínimo)

#c. Mostrar la desviación estándar por curso, docente, carrera, campus.
    
    Desv_Std <- sqldf('SELECT TC.Curso, TP.Nombre, TCAR.Carrera, TCA.Sede,
                           STDEV (Puntaje) as "Desv_Std"
                           FROM Tabla_Encuentas TE
                           INNER JOIN Tabla_Seccion TS ON TS.ID_Seccion = TE.ID_SeccionE
                           INNER JOIN Tabla_Curso TC ON TC.ID_Curso = TS.ID_CursoS
                           INNER JOIN Tabla_Profesor TP ON TP.ID_Profesor = TS.ID_ProfesorS
                           INNER JOIN Tabla_Campus TCA ON TCA.ID_Campus = TS.ID_CampusS
                           INNER JOIN Tabla_Facultad TF ON TF.ID_Facultad = TE.ID_FacultadE
                           INNER JOIN Tabla_Carrera TCAR ON TCAR.ID_Carrera = TF.ID_CarreraF
                           GROUP BY TC.Curso')
    View(Desv_Std)

#d. Mostrar top Carreras con mayor dispercion
    
    Top_Carreras <- sqldf('SELECT TCAR.Carrera,
                          STDEV (Puntaje) as "Desv_Std" 
                          FROM Tabla_Encuentas TE
                          INNER JOIN Tabla_Facultad TF ON TF.ID_Facultad = TE.ID_FacultadE
                          INNER JOIN Tabla_Carrera TCAR ON TCAR.ID_Carrera = TF.ID_CarreraF
                          GROUP BY TCAR.Carrera
                          ORDER BY TCAR.Carrera DESC')
    View(Top_Carreras)
    
#e. Top10 de Profesores con mayor puntaje por carrera y campus.  
    
    Top_Profesores <- sqldf('SELECT TP.Nombre,TP.Apellido, TCAR.Carrera, TCA.Sede, TE.Puntaje
                      FROM Tabla_Encuentas TE
                      INNER JOIN Tabla_Seccion TS ON TS.ID_Seccion = TE.ID_SeccionE
                      INNER JOIN Tabla_Profesor TP ON TP.ID_Profesor = TS.ID_ProfesorS
                      INNER JOIN Tabla_Campus TCA ON TCA.ID_Campus = TS.ID_CampusS
                      INNER JOIN Tabla_Facultad TF ON TF.ID_Facultad = TE.ID_FacultadE
                      INNER JOIN Tabla_Carrera TCAR ON TCAR.ID_Carrera = TF.ID_CarreraF
                      GROUP BY TP.Nombre
                      ORDER BY TE.Puntaje DESC
                      LIMIT 10')
    View(Top_Profesores)
       

  

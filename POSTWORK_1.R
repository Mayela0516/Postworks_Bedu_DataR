
library(dplyr)
install.packages("tidyr")
library(tidyr)

#Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R,
#los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

equipos_fut <- read.csv('https://www.football-data.co.uk/mmz4281/1920/SP1.csv')
str(equipo_fut)

#Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles 
#anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante 
#(FTAG) Consulta cómo funciona la función table en R al ejecutar en la consola ?table


goles <- equipos_fut[, c('FTHG', 'FTAG')]
partidos <- length(goles$FTHG)


#Posteriormente elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:
  
#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...) 
#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...) 
#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote 
#y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)


Fgh <- goles %>%group_by(FTHG) %>% summarise(frec = n())
prob_h <- Fgh$frec / partidos
table_h <- data.frame(Fgh$FTHG, Fgh$frec, prob_h)


Fga <- goles %>%group_by(FTAG) %>% summarise(frec = n())
prob_a <- Fga$frec / partidos
table_a <- data.frame(Fga$FTAG, Fga$frec, prob_a)


prob.marg <- goles %>%group_by(variables) %>% summarise(frequency = n())


df<-read.csv("C:/Users/Andre/Desktop/data/hotel_bookings.csv", sep=",")
# Para contar los Na totales en todo el dataset
sum(is.na(df))
#para contar los NA en cada colummna
colSums(is.na(df))

# Mostrar las filas y columnas que contienen NA
which(is.na(df), arr.ind = TRUE)

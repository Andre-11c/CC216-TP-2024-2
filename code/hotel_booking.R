df<-read.csv("C:/Users/Andre/Documents/UPC/CC216-TP-2024-2/data", sep=",")
# Para contar los Na totales en todo el dataset
sum(is.na(df))
#para contar los NA en cada colummna
colSums(is.na(df))

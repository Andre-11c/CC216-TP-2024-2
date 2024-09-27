
#identificacion y tratamiento de datos faltantes

df<-read.csv("C:/Users/Andre/Desktop/data/hotel_bookings.csv", sep=",")
# Para contar los Na totales en todo el dataset
sum(is.na(df))
#para contar los NA en cada colummna
colSums(is.na(df))

# Mostrar las filas y columnas que contienen NA
which(is.na(df), arr.ind = TRUE)


#identificacion y tratamiento de datos atipicos

# Cargar las librerías necesarias
library(dplyr)
library(ggplot2)

#cargar datos
setwd("C:/Users/zRnd/Documents/data tp")
# Cargar los datos
df <- read.csv("hotel_bookings.csv")

# Crear una función para detectar y eliminar outliers usando el método IQR
remove_outliers <- function(df, column) {
  Q1 <- quantile(df[[column]], 0.25, na.rm = TRUE)
  Q3 <- quantile(df[[column]], 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  
  # Definir límites inferior y superior
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  
  # Eliminar los outliers
  df_clean <- df %>% filter(df[[column]] >= lower_bound & df[[column]] <= upper_bound)
  
  return(df_clean)
}

# Eliminar los outliers de la variable 'adr'
df_clean <- remove_outliers(df, 'adr')

# Crear los boxplots
par(mfrow = c(1, 2))  # Dividir el gráfico en 2 columnas

# Boxplot para la variable con outliers
boxplot(df$adr, main = "Variable ADR con outliers", col = "skyblue")

# Boxplot para la variable sin outliers
boxplot(df_clean$adr, main = "Variable ADR sin outliers", col = "lightgreen")

# Volver a la configuración de gráficos normal
par(mfrow = c(1, 1))
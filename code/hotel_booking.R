
#identificacion y tratamiento de datos faltantes

df<-read.csv("C:/Users/Andre/Desktop/data/hotel_bookings.csv", sep=",")
# Para contar los Na totales en todo el dataset
sum(is.na(df))
#para contar los NA en cada colummna
colSums(is.na(df))

# Mostrar las filas y columnas que contienen NA
which(is.na(df), arr.ind = TRUE)

# Cargar librerías necesarias
library(tidyverse) # Para manipulación de datos y gráficos
library(naniar)    # Para visualización de valores faltantes

# 1. Cargar el dataset
df <- read.csv("C:/Users/Andre/Desktop/data/hotel_bookings.csv")

# 2. Visualizar los primeros registros del dataset para familiarizarse con los datos
head(df)

# 3. Resumen de los datos para identificar columnas con valores faltantes
summary(df)

# 4. Identificación visual de valores faltantes
# Se puede usar la librería 'naniar' para hacer un gráfico que muestre los valores faltantes.
gg_miss_var(df)

# 5. Contar cuántos valores faltantes tiene cada columna
na_count <- sapply(df, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(Columna = names(df), NA_Conteo = na_count)
print(na_count)

# 6. Eliminación de filas o columnas con valores faltantes
# Si queremos eliminar todas las filas que tienen al menos un NA:
df_sin_na_filas <- na.omit(df)

# Si preferimos eliminar columnas que tienen muchos valores faltantes:
# Aquí eliminamos columnas con más del 50% de valores faltantes.
limite_faltantes <- 0.5 * nrow(df)  # Calculamos el límite
df_sin_na_columnas <- df[, colSums(is.na(df)) < limite_faltantes]

# 7. Imputación de valores faltantes
# Otra opción es imputar los valores faltantes. Podemos hacer una imputación simple usando la media (para datos numéricos):
df$columna_con_na <- ifelse(is.na(df$columna_con_na), 
                            mean(df$columna_con_na, na.rm = TRUE), 
                            df$columna_con_na)

# También podemos imputar la mediana:
df$columna_con_na <- ifelse(is.na(df$columna_con_na), 
                            median(df$columna_con_na, na.rm = TRUE), 
                            df$columna_con_na)

# Para datos categóricos podemos imputar el valor más frecuente (moda):
moda <- function(x) {
  return(names(sort(table(x), decreasing = TRUE)[1]))
}

df$columna_categorica_con_na <- ifelse(is.na(df$columna_categorica_con_na), 
                                       moda(df$columna_categorica_con_na), 
                                       df$columna_categorica_con_na)

# 8. Validación del tratamiento
# Verificamos nuevamente si hay valores faltantes después del tratamiento
sapply(df, function(y) sum(is.na(y)))

# También podemos graficar nuevamente para asegurarnos que no quedan valores NA
gg_miss_var(df)


#identificacion y tratamiento de datos atipicos

# Cargar las librerías necesarias
library(dplyr)
library(ggplot2)


# Cargar los datos
df <- read.csv("C:/Users/Andre/Desktop/data/hotel_bookings.csv")

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
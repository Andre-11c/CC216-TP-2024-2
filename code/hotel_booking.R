#################PRE-PROCESAMIENTO DE DATOS############################
#######################################################################
#identificacion y tratamiento de datos faltantes

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


#################Visualización de datos################################
#######################################################################

#1. ¿Cuántas reservas se realizan por tipo de hotel? 
#¿Qué tipo de hotel prefiere la gente?
# Cargar librerías
library(ggplot2)

# Contar reservas por tipo de hotel
reservas_hotel <- table(df$hotel)

# Gráfico de barras
ggplot(df, aes(x = hotel)) +
  geom_bar(fill = "skyblue") +
  labs(title = "Reservas por Tipo de Hotel", x = "Tipo de Hotel", y = "Cantidad de Reservas") +
  theme_minimal()

# Conclusión: Dependiendo de los datos, se verá si los huéspedes prefieren más hoteles "Resort" o "City".


#2. ¿Está aumentando la demanda con el tiempo?
# Contar reservas por año
reservas_anio <- table(df$arrival_date_year)

# Gráfico de línea
ggplot(df, aes(x = as.factor(arrival_date_year))) +
  geom_bar(fill = "lightgreen") +
  labs(title = "Reservas por Año", x = "Año", y = "Cantidad de Reservas") +
  theme_minimal()

# Conclusión: El gráfico muestra si la demanda ha aumentado o disminuido a lo largo de los años.


#3. ¿Cuáles son las temporadas de reservas (alta, media, baja)?
# Contar reservas por mes
reservas_mes <- table(df$arrival_date_month)

# Gráfico de barras ordenado por mes
ggplot(df, aes(x = factor(arrival_date_month, levels = month.name))) +
  geom_bar(fill = "lightcoral") +
  labs(title = "Reservas por Mes", x = "Mes", y = "Cantidad de Reservas") +
  theme_minimal()

# Conclusión: Se puede observar si hay una temporada alta (meses con mayor cantidad de reservas) y una temporada baja.

#4. ¿Cuándo es menor la demanda de reservas?
# Utilizamos el mismo gráfico anterior para observar los meses con menor demanda
# Observa el gráfico de barras para identificar los meses con menor demanda.

# Conclusión: Los meses con menor demanda son aquellos con las barras más bajas, indicando las temporadas bajas.

#5. ¿Cuántas reservas incluyen niños y/o bebés?
# Contar reservas que incluyen niños o bebés
reservas_ninos_bebes <- nrow(df[df$children > 0 | df$babies > 0, ])

# Mostrar el número
print(paste("Reservas con niños o bebés:", reservas_ninos_bebes))

# Gráfico de barras
df$reserva_con_ninos <- ifelse(df$children > 0 | df$babies > 0, "Con niños/bebés", "Sin niños/bebés")
ggplot(df, aes(x = reserva_con_ninos)) +
  geom_bar(fill = "lightblue") +
  labs(title = "Reservas que Incluyen Niños y/o Bebés", x = "Tipo de Reserva", y = "Cantidad de Reservas") +
  theme_minimal()

# Conclusión: Se puede observar qué porcentaje de las reservas incluyen niños o bebés.

#6. ¿Es importante contar con espacios de estacionamiento?
# Contar reservas que solicitan estacionamiento
reservas_estacionamiento <- nrow(df[df$required_car_parking_spaces > 0, ])

# Mostrar el número
print(paste("Reservas con espacios de estacionamiento:", reservas_estacionamiento))

# Gráfico de barras
df$reserva_con_parking <- ifelse(df$required_car_parking_spaces > 0, "Con Parking", "Sin Parking")
ggplot(df, aes(x = reserva_con_parking)) +
  geom_bar(fill = "lightpink") +
  labs(title = "Reservas que Incluyen Espacio de Estacionamiento", x = "Tipo de Reserva", y = "Cantidad de Reservas") +
  theme_minimal()

# Conclusión: Si una cantidad significativa de reservas incluye estacionamiento, su disponibilidad es importante.

#7. ¿En qué meses del año se producen más cancelaciones de reservas?
# Filtrar las reservas canceladas
reservas_canceladas <- df[df$is_canceled == 1, ]

# Gráfico de barras de cancelaciones por mes
ggplot(reservas_canceladas, aes(x = factor(arrival_date_month, levels = month.name))) +
  geom_bar(fill = "orange") +
  labs(title = "Cancelaciones por Mes", x = "Mes", y = "Cantidad de Cancelaciones") +
  theme_minimal()

# Conclusión: Se puede observar en qué meses del año las cancelaciones son más frecuentes.


















name:r
# Cargar librerías necesarias
library(tidyverse)

# Cargar datos (asumiendo que ya hemos tratado los datos faltantes)
hotel_data <- read.csv("hotel_bookings_clean.csv")

# Función para identificar outliers usando el método IQR
identify_outliers <- function(x) {
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  return(x < lower_bound | x > upper_bound)
}

# Identificar outliers en columnas numéricas
numeric_columns <- sapply(hotel_data, is.numeric)
outliers <- sapply(hotel_data[, numeric_columns], identify_outliers)

# Imprimir el número de outliers por columna
print(colSums(outliers))

# Función para tratar outliers (usando winsorización)
treat_outliers <- function(x) {
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  x[x < lower_bound] <- lower_bound
  x[x > upper_bound] <- upper_bound
  return(x)
}

# Aplicar tratamiento de outliers
hotel_data_clean <- hotel_data %>%
  mutate(across(where(is.numeric), treat_outliers))

# Verificar el tratamiento
outliers_after <- sapply(hotel_data_clean[, numeric_columns], identify_outliers)
print(colSums(outliers_after))

# Guardar datos limpios
write.csv(hotel_data_clean, "hotel_bookings_clean_no_outliers.csv", row.names = FALSE)

# Visualizar la distribución antes y después del tratamiento para una variable
# (por ejemplo, 'lead_time')
par(mfrow = c(1, 2))
hist(hotel_data$lead_time, main = "Lead Time - Antes", xlab = "Lead Time")
hist(hotel_data_clean$lead_time, main = "Lead Time - Después", xlab = "Lead Time")

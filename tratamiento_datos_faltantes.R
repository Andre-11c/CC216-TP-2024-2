name: r
# Cargar librerías
library(tidyverse)

# Cargar datos
hotel_data <- read.csv("hotel_bookings.csv")

# Identificar datos faltantes
missing_data <- colSums(is.na(hotel_data))
print(missing_data)

# Tratar datos faltantes
hotel_data_clean <- hotel_data %>%
  mutate(across(where(is.numeric), ~ifelse(is.na(.), mean(., na.rm = TRUE), .)))

# Verificar tratamiento
missing_data_after <- colSums(is.na(hotel_data_clean))
print(missing_data_after)

# Guardar datos limpios
write.csv(hotel_data_clean, "hotel_bookings_clean.csv", row.names = FALSE)

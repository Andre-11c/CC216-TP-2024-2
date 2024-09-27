name: r
# Cargar librerías necesarias  
install.packages("dplyr")
install.packages("ggplot2")
install.packages("readr")  
library(readr) 
library(ggplot2)  
setwd("E:/base")
# Cargar el archivo CSV  
hotel_data <- read.csv("hotel_bookings.csv", na.strings = "")  

# Mostrar las primeras filas del DataFrame  
head(hotel_data)

# Reemplazar espacios en blanco con NA  
hotel_data[hotel_data == ""] <- NA  

# Cargar el archivo CSV  
hotel_data <- read.csv("hotel_bookings.csv")  

# Reemplazar espacios en blanco con NA  
hotel_data[hotel_data == ""] <- NA  

# Cargar el archivo CSV  
hotel_data <- read.csv("hotel_bookings.csv")  

# Reemplazar espacios en blanco con NA  
hotel_data[hotel_data == ""] <- NA  

# Limpiar nombres de columnas eliminando espacios en blanco  
colnames(hotel_data) <- trimws(colnames(hotel_data))  

# Filtrar los datos relevantes  
analysis_data <- hotel_data[, c("reservation_status", "lead_time", "arrival_date_month", "hotel", "adr")]  

# Convertir reservation_status a un factor  
analysis_data$reservation_status <- as.factor(analysis_data$reservation_status)  

# Crear una tabla de contingencia para calcular las tasas de cancelación  
cancellation_table <- table(analysis_data$arrival_date_month,   
                            analysis_data$hotel,   
                            analysis_data$reservation_status)  

# Calcular la tasa de cancelación  
cancellation_rate <- prop.table(cancellation_table, margin = c(1, 2)) * 100  

# Extraer solo las tasas de cancelación  
cancellation_rate <- cancellation_rate[, , "Canceled"]  

# Graficar usando barplot  
barplot(cancellation_rate,   
        beside = TRUE,   
        col = c("lightblue", "lightgreen"),   
        main = "Tasa de Cancelaciones por Mes y Tipo de Hotel",  
        xlab = "Mes de Llegada",   
        ylab = "Tasa de Cancelación (%)",  
        legend = rownames(cancellation_rate))
# Cargar el archivo CSV  
hotel_data <- read.csv("hotel_bookings.csv")  

# Reemplazar espacios en blanco con NA  
hotel_data[hotel_data == ""] <- NA  

# Limpiar nombres de columnas eliminando espacios en blanco  
colnames(hotel_data) <- trimws(colnames(hotel_data))  

# Filtrar los datos relevantes  
analysis_data <- hotel_data[, c("reservation_status", "lead_time", "arrival_date_month", "hotel", "adr")]  

# Convertir reservation_status a un factor  
analysis_data$reservation_status <- as.factor(analysis_data$reservation_status)  

# Crear una tabla de contingencia para calcular las tasas de cancelación  
cancellation_table <- table(analysis_data$arrival_date_month,   
                            analysis_data$hotel,   
                            analysis_data$reservation_status)  

# Calcular la tasa de cancelación  
cancellation_rate <- prop.table(cancellation_table, margin = c(1, 2)) * 100  

# Extraer solo las tasas de cancelación  
cancellation_rate <- cancellation_rate[, , "Canceled"]  

# Graficar usando barplot  
barplot(cancellation_rate,   
        beside = TRUE,   
        col = c("lightblue", "lightgreen"),   
        main = "Tasa de Cancelaciones por Mes y Tipo de Hotel",  
        xlab = "Mes de Llegada",   
        ylab = "Tasa de Cancelación (%)",  
        legend = rownames(cancellation_rate))

#P1:¿Cuántas reservas se realizan por tipo de hotel? ¿Qué tipo de hotel prefiere la gente?

# Contar reservas por tipo de hotel  
reservas_por_hotel <- table(hotel_data$hotel)  
print(reservas_por_hotel)  

# Tipo de hotel más reservado  
hotel_preferido <- names(which.max(reservas_por_hotel))  
print(paste("El tipo de hotel preferido es:", hotel_preferido))

#P2: ¿Está aumentando la demanda con el tiempo?

# Suponiendo que tienes columnas para el año y mes de reserva  
# Crear una nueva columna con la fecha de llegada  
hotel_data$arrival_date <- as.Date(paste(hotel_data$arrival_date_year, hotel_data$arrival_date_month, "01", sep="-"))  

# Contar reservas por año  
demandas_tiempo <- as.data.frame(table(format(hotel_data$arrival_date, "%Y-%m")))  
colnames(demandas_tiempo) <- c("Fecha", "Reservas")  
#COMPROBAR ERROR
str(hotel_data)
# Supongamos que arrival_date_month tiene nombres de meses (ej. "January", "February")
install.packages("lubridate")
library(lubridate)  
hotel_data$arrival_date <- as.Date(paste(hotel_data$arrival_date_year, hotel_data$arrival_date_month, "01", sep="-"), format="%Y-%B-%d")  
head(hotel_data$arrival_date
     meses <- c("January", "February", "March", "April", "May", "June",   
                "July", "August", "September", "October", "November", "December")  
     hotel_data$arrival_date_month_num <- match(hotel_data$arrival_date_month, meses)  
     hotel_data$arrival_date <- as.Date(paste(hotel_data$arrival_date_year, hotel_data$arrival_date_month_num, "01", sep="-"), format="%Y-%m-%d")
     tryCatch({  
       hotel_data$arrival_date <- as.Date(paste(hotel_data$arrival_date_year, hotel_data$arrival_date_month, "01", sep="-"), format="%Y-%B-%d")  
     }, error = function(e) {  
       print(e)  
     })
#2 Visualizar la tendencia  
     install.packages("tidyverse")
     library(tidyverse)
     hotel_data_clean <- subset(hotel_data, !apply(hotel_data, 1, function(x) any(is.na(x) | x == "NULL")))
     library(dplyr)
     hotel_data_clean <- filter_all(hotel_data, all_vars(!is.na(.) & . != "NULL"))
     hotel_data_clean <- hotel_data[!apply(hotel_data, 1, function(x) any(is.na(x) | x == "NULL")), ]
     # Verificar el número de filas antes y después
     print(paste("Filas antes:", nrow(hotel_data)))
     print(paste("Filas después:", nrow(hotel_data_clean)))
     # Suponiendo que tienes columnas para el año y mes de reserva  
     
     # Crear una nueva columna con la fecha de llegada  
     hotel_data$arrival_date <- as.Date(paste(hotel_data$arrival_date_year, hotel_data$arrival_date_month, "01", sep="-"))  
     
     # Contar reservas por año  
     demandas_tiempo <- as.data.frame(table(format(hotel_data$arrival_date, "%Y-%m")))  
     colnames(demandas_tiempo) <- c("Fecha", "Reservas")  
     
     # Visualizar la tendencia  
     library(ggplot2)  
     ggplot(demandas_tiempo, aes(x = Fecha, y = Reservas)) +  
       geom_line() +  
       labs(title = "Tendencia de Reservas a lo Largo del Tiempo", x = "Fecha", y = "Número de Reservas")
     
#P3: ¿Cuáles son las temporadas de reservas (alta, media, baja)?
     seasonal_demand <- hotel_data %>%
       group_by(arrival_date_month) %>%
       summarise(bookings = n()) %>%
       mutate(month = factor(arrival_date_month, levels = month.name))
     
     ggplot(seasonal_demand, aes(x = month, y = bookings)) +
       geom_bar(stat = "identity") +
       labs(title = "Demanda por mes", x = "Mes", y = "Número de reservas") +
       theme(axis.text.x = element_text(angle = 45, hjust = 1))
#P4: ¿Cuándo es menor la demanda de reservas?
#se ve en grafico de reservas
#P5: ¿Cuántas reservas incluyen niños y/o bebés?
     reservations_with_children <- hotel_data %>%
       filter(children > 0 | babies > 0) %>%
       nrow()
     
     print(paste("Reservas que incluyen niños y/o bebés:", reservations_with_children))
     print(paste("Porcentaje del total:", round(reservations_with_children / nrow(hotel_data) * 100, 2), "%"))
#P6 ¿Es importante contar con espacios de estacionamiento?
     parking_demand <- hotel_data %>%
       group_by(required_car_parking_spaces) %>%
       summarise(count = n()) %>%
       mutate(percentage = count / sum(count) * 100)
     
     print(parking_demand)
     
     ggplot(parking_demand, aes(x = as.factor(required_car_parking_spaces), y = count)) +
       geom_bar(stat = "identity") +
       labs(title = "Demanda de espacios de estacionamiento", x = "Espacios requeridos", y = "Número de reservas")
     
#P7: ¿En qué meses del año se producen más cancelaciones de reservas?
     cancellations_by_month <- hotel_data %>%
       filter(is_canceled == 1) %>%
       group_by(arrival_date_month) %>%
       summarise(cancellations = n()) %>%
       mutate(month = factor(arrival_date_month, levels = month.name))
     
     ggplot(cancellations_by_month, aes(x = month, y = cancellations)) +
       geom_bar(stat = "identity") +
       labs(title = "Cancelaciones por mes", x = "Mes", y = "Número de cancelaciones") +
       theme(axis.text.x = element_text(angle = 45, hjust = 1))

# CC216-TP-2024-2
# Contenidos

1. [Objetivos del trabajo](#data1)

2. [Integrantes](#data2)

3. [Dataset](#data3)

4. [Conclusiones](#data4)
        
5. [Licencia](#data5)

## 1. Objetivos del trabajo <a name="data1"></a>
Realizar un análisis exploratorio de un conjunto de datos de un hotel (EDA), generando visualizaciones,
preparando los datos y extrayendo conclusiones iniciales utilizando R/RStudio como herramienta
de software.
## 2. Integrantes <a name="data2"></a>
* Chipana Rios Andre
* Huaman Sirio Diego
* Olivera Alvarez Lizbeth
## 3. Dataset <a name="data3"></a>
Origen de los datos: https://www.sciencedirect.com/science/article/pii/S2352340918315191
<img src="Imagenes/Bellagio-Hotel-Casino-Las-Vegas.webp" alt="hotel" style="width: 700px;"/>
<p></p>
Figura 1: Hotel 

El origen de los datos utilizados en el estudio proviene de los sistemas de gestión de propiedades (PMS) de dos hoteles en Portugal: un hotel resort en Algarve y un hotel urbano en Lisboa. Los datos fueron extraídos mediante consultas TSQL y procesados utilizando R. Las variables incluyen aspectos relacionados con las reservas, cancelaciones y características de los huéspedes, preservando la privacidad al eliminar identificadores sensibles. Estos conjuntos de datos están disponibles para su uso en investigación y educación en áreas como la gestión de ingresos y el aprendizaje automático.

**Casos de Uso Aplicables:** 
* Interesados en este análisis:
  * Gerentes de hoteles
  * Departamentos de marketing de hoteles
  * Agencias de viajes
  * Plataformas de reserva en línea
  * Investigadores en turismo y hospitalidad
* Problemas o necesidades que responde este análisis:
  * Optimización de la ocupación hotelera
  * Predicción de demanda estacional
  * Mejora de estrategias de marketing
  * Planificación de recursos (personal, servicios) 
  * Entendimiento de preferencias de los clientes
Aún hablando un poco sobre el dataset, vamos a mirar un poco más de información sobre el mismo:
<p></p>

**Conjunto de Datos**
<table>
  <thead>
    <tr>
      <th>Variable</th>
      <th>Tipo</th>
      <th>Descripción</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ADR</td>
      <td>Numérica</td>
      <td>Tarifa diaria promedio, calculada dividiendo el total de transacciones de alojamiento por noches totales.</td>
    </tr>
    <tr>
      <td>Adults</td>
      <td>Entero</td>
      <td>Número de adultos en la reserva.</td>
    </tr>
    <tr>
      <td>Agent</td>
      <td>Categórica</td>
      <td>ID de la agencia de viajes que realizó la reserva.</td>
    </tr>
    <tr>
      <td>ArrivalDateDayOfMonth</td>
      <td>Entero</td>
      <td>Día del mes de la fecha de llegada.</td>
    </tr>
    <tr>
      <td>ArrivalDateMonth</td>
      <td>Categórica</td>
      <td>Mes de llegada, con 12 categorías de "Enero" a "Diciembre".</td>
    </tr>
    <tr>
      <td>ArrivalDateWeekNumber</td>
      <td>Entero</td>
      <td>Número de la semana de la fecha de llegada.</td>
    </tr>
    <tr>
      <td>ArrivalDateYear</td>
      <td>Entero</td>
      <td>Año de la fecha de llegada.</td>
    </tr>
    <tr>
      <td>AssignedRoomType</td>
      <td>Categórica</td>
      <td>Código del tipo de habitación asignada, puede diferir del reservado por razones operativas o solicitud del cliente.</td>
    </tr>
    <tr>
      <td>Babies</td>
      <td>Entero</td>
      <td>Número de bebés en la reserva.</td>
    </tr>
    <tr>
      <td>BookingChanges</td>
      <td>Entero</td>
      <td>Número de cambios realizados en la reserva antes del check-in o cancelación.</td>
    </tr>
    <tr>
      <td>Children</td>
      <td>Entero</td>
      <td>Número de niños, incluye tanto los de pago como los no de pago.</td>
    </tr>
    <tr>
      <td>Company</td>
      <td>Categórica</td>
      <td>ID de la empresa o entidad responsable de la reserva o del pago.</td>
    </tr>
    <tr>
      <td>Country</td>
      <td>Categórica</td>
      <td>País de origen, usando el formato ISO 3155-3:2013.</td>
    </tr>
    <tr>
      <td>CustomerType</td>
      <td>Categórica</td>
      <td>Tipo de reserva, puede ser: Contrato, Grupo, Transitoria o Transitoria-partido.</td>
    </tr>
    <tr>
      <td>DaysInWaitingList</td>
      <td>Entero</td>
      <td>Número de días que la reserva estuvo en lista de espera antes de ser confirmada.</td>
    </tr>
    <tr>
      <td>DepositType</td>
      <td>Categórica</td>
      <td>Tipo de depósito realizado para garantizar la reserva, puede ser: No Depósito, No Reembolsable o Reembolsable.</td>
    </tr>
    <tr>
      <td>DistributionChannel</td>
      <td>Categórica</td>
      <td>Canal de distribución de la reserva (Agentes de Viajes o Operadores Turísticos).</td>
    </tr>
    <tr>
      <td>IsCanceled</td>
      <td>Categórica</td>
      <td>Indica si la reserva fue cancelada (1) o no (0).</td>
    </tr>
    <tr>
      <td>IsRepeatedGuest</td>
      <td>Categórica</td>
      <td>Indica si el huésped es recurrente (1) o no (0).</td>
    </tr>
    <tr>
      <td>LeadTime</td>
      <td>Entero</td>
      <td>Número de días entre la creación de la reserva y la fecha de llegada.</td>
    </tr>
    <tr>
      <td>MarketSegment</td>
      <td>Categórica</td>
      <td>Segmento de mercado de la reserva (Agentes de Viajes o Operadores Turísticos).</td>
    </tr>
    <tr>
      <td>Meal</td>
      <td>Categórica</td>
      <td>Tipo de paquete de comidas reservado (Ej: Sin comidas, Desayuno incluido, Media pensión, Pensión completa).</td>
    </tr>
    <tr>
      <td>PreviousBookingsNotCanceled</td>
      <td>Entero</td>
      <td>Número de reservas previas no canceladas por el cliente.</td>
    </tr>
    <tr>
      <td>PreviousCancellations</td>
      <td>Entero</td>
      <td>Número de reservas previas canceladas por el cliente.</td>
    </tr>
    <tr>
      <td>RequiredCardParkingSpaces</td>
      <td>Entero</td>
      <td>Número de espacios de estacionamiento requeridos por el cliente.</td>
    </tr>
    <tr>
      <td>ReservationStatus</td>
      <td>Categórica</td>
      <td>Estado final de la reserva, puede ser: Cancelada, Check-Out, o No Show.</td>
    </tr>
    <tr>
      <td>ReservationStatusDate</td>
      <td>Fecha</td>
      <td>Fecha en la que se estableció el último estado de la reserva.</td>
    </tr>
    <tr>
      <td>ReservedRoomType</td>
      <td>Categórica</td>
      <td>Código del tipo de habitación reservada.</td>
    </tr>
    <tr>
      <td>StaysInWeekendNights</td>
      <td>Entero</td>
      <td>Número de noches de fin de semana que el huésped reservó o se hospedó.</td>
    </tr>
    <tr>
      <td>StaysInWeekNights</td>
      <td>Entero</td>
      <td>Número de noches entre semana que el huésped reservó o se hospedó.</td>
    </tr>
    <tr>
      <td>TotalOfSpecialRequests</td>
      <td>Entero</td>
      <td>Número de solicitudes especiales realizadas por el cliente (Ej: Cama gemela o piso alto).</td>
    </tr>
  </tbody>
</table>



## 4. Conclusiones <a name="data4"></a>
El análisis de los datos revela que las reservas con mayor anticipación tienden a tener una mayor tasa de cancelación, sugiriendo la necesidad de ajustar las políticas de cancelación para este grupo. Los hoteles "Resort" presentan estadías más largas y menores tasas de cancelación en comparación con los hoteles urbanos, lo que indica diferencias en el comportamiento de los clientes según el tipo de hotel. Además, los clientes con solicitudes especiales tienen menos probabilidades de cancelar, lo que sugiere un mayor compromiso. Finalmente, se observó una estacionalidad en las reservas, con picos en meses turísticos, lo que resalta la importancia de ajustar las estrategias de marketing y precios según la temporada.
## 5.Licencia <a name="data5"></a>
MIT License

Copyright (c) 2024 Andre Chipana 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

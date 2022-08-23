# Forecast API App

Challenge de Ruby on Rails

Cliente API que devuelve una lista de ciudades junto con los pronósticos para los próximos 7 días.

Utiliza la API de Reservamos MX para obtener una lista de ciudades de acuerdo a un query de búsqueda.

Hace uso de la API de Open Weather Map para obtener los pronósticos del clima para dichas ciudades.

Modo de uso:
- Clonar repositorio
git clone https://github.com/zeroxcharlie/forecasts-api-app.git

- Instalar dependencias
bundle

- Ejecutar servidor Puma
rails S

- Acceder al endpoint (cambiar valor de query a valor deseado)
http://localhost:3000/?query=queretaro
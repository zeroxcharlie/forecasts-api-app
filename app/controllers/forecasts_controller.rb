class ForecastsController < ApplicationController


    def index

        # Get city query from Params or Request Body
        query = params[:query]

        # Call Reservamos MX API for places
        reservamos_url = 'https://search.reservamos.mx/api/v2/places?q=' + query
        places = JSON.parse RestClient.get reservamos_url
        
        # Remove non-city type locations
        cities = places.select {|place| place['result_type'] == 'city'}

        # Get forecast for each city  
        cities.each do |city|
            # openweathermap API URL, includes API key and different parameters
            weather_url = 'https://api.openweathermap.org/data/2.5/onecall?appid=a5a47c18197737e8eeca634cd6acb581&exclude=minutely,hourly,alerts,current&units=metric&lang=es'
            city_weather_url = weather_url + '&lat=' + city['lat'] + '&lon=' + city['long']
            forecast = JSON.parse RestClient.get city_weather_url
            
            # Append complete forecast data into each city in the list
            # city['forecast'] = forecast
            
            # Only append min and max temperatures for each day           
            daily_forecast_arr = forecast['daily']
            daily_forecast_arr.each do |daily_forecast|
                daily_forecast.select! { |i| i == 'temp' }
                daily_forecast['temp'].select! { |i| i == 'min' || i == 'max' }
            end

            # Append forecast data into city data
            city['forecast'] = daily_forecast_arr
        end
        
        # Prepare JSON response
        response = cities

        # Render JSON response to the client
        render json: response
    end
end

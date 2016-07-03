require './weather'


@weather_data = WeatherData.new
#current_display = CurrentConditionsDisplay.new
#@weather_data.add_observer(current_display)
#statistics_display = StatisticsDisplay.new
#@weather_data.add_observer(statistics_display)

forecast_display = ForecastDisplay.new
    @weather_data.add_observer(forecast_display)
@weather_data.set_measurements(80.0, 65.0, 30.4)
@weather_data.set_measurements(82.0, 70.0, 29.2)
@weather_data.set_measurements(78.0, 90.0, 29.2)


 
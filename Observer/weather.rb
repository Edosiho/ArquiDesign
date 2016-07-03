# Template Observer Pattern
# Date: 3-Feb-2016
# Authors:
#          A01165829 Eduardo Rodriguez Ruiz

require 'observer'

class WeatherData
	include Observable

	def set_measurements (temperature, humidity, pressure)
		changed
		notify_observers(temperature,humidity,pressure);
	end
end

class CurrentConditionsDisplay
	def update(temperature,humidity,pressure)
		print "Current conditions: #{temperature}°F and #{humidity}% humidity\n"
	end
end

class StatisticsDisplay
	attr_accessor :temps
	def initialize
		@temps = []
	end

	def update(temperature,humidity,pressure)
		@temps.push(temperature);
			num = (@temps.inject{ |sum, el| sum + el }.to_f) / @temps.size
			minMax= @temps.minmax
		print "Avg/Max/Min temperature = #{num}/#{minMax[1]}/#{minMax[0]}\n"
	end
end

class ForecastDisplay
	attr_accessor :pastpress
	def initialize
		@pastpress = 0
	end
	def update(temperature,humidity,pressure)
		if @pastpress == 0
			print "Forecast: Improving weather on the way!\n"
		elsif pressure == @pastpress
			print "Forecast: More of the same\n"
			
		elsif pressure > @pastpress
			print "Forecast; Its coming in hot\n"
		else 
			print "Forecast: Watch out for cooler, rainy weather\n"
		end
		@pastpress = pressure
	end
end
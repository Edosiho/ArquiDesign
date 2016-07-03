# Decorator Pattern
# Date: 16-March-2016
# Authors:
#          A01165829 Eduardo Rodriguez Ruiz

class Beverage
	def initialize
	end
end


class DarkRoast < Beverage
	def description
		@description ="Dark Roast Coffee"
	end
	def cost
		@cost = 0.99
	end
end

class Espresso < Beverage
	def description
		@description ="Espresso"
	end
	def cost
		@cost = 1.99
	end
end

class HouseBlend < Beverage
	def description
		@description ="House Blend Coffee"
	end
	def cost
		@cost = 0.89
	end
end

class CondimentDecorator < Beverage
	def initialize(coffee)
		@coffee = coffee
	end

end

class Mocha < CondimentDecorator
	def description
		@coffee.description + ", Mocha"
	end
	def cost
		@coffee.cost + 0.2
	end
end

class Whip < CondimentDecorator
	def description
		@coffee.description + ", Whip"
	end
	def cost
		@coffee.cost + 0.10
	end
end

class Soy < CondimentDecorator
	def description
		@coffee.description + ", Soy"
	end
	def cost
		@coffee.cost + 0.15
	end
end

class Milk < CondimentDecorator
	def description
		@coffee.description + ", Milk"
	end
	def cost
		@coffee.cost + 0.1
	end
end
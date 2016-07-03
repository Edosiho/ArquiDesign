#==========================================================
# Eduardo Rodríguez Ruiz A01165829
#==========================================================

#==========================================================
# Code for question 1

class Troll
  attr_reader :name, :power
  def initialize(name, power)
    @name = name
    @power = power
  end
  def to_s
    "#{ @name } (#{ @power})"
  end
end

#----------------------------------------------------------
# Place here your code for these classes: TrollArmy,
# NameFormationStrategy, and PowerFormationStrategy.

class TrollArmy
	attr_accessor :formation_strategy, :trolls
	def initialize()
		@trolls = []
		@formation_strategy = nil
	end
	def add(troll)
		@trolls.push(troll)
		return self
	end
	def attack
		if @formation_strategy == nil
			print "Undefined strategy, cannot attack.\n"
		else
			if @formation_strategy.name == "name"
			@trolls.sort!{|x,y| x.name <=> y.name}
			elsif @formation_strategy.name == "power"
			@trolls.sort!{|x,y| y.power <=> x.power}
			end
			print "*** Attack formation ***\n"
			
			i =0
			while i < @trolls.length
			print @trolls[i].to_s + "\n"
			i += 1
			end
		end
	end
end

class NameFormationStrategy
	attr_accessor :name
	def initialize()
		@name = "name"
	end
end
class PowerFormationStrategy
	attr_accessor :name
	def initialize()
		@name = "power"
	end
end
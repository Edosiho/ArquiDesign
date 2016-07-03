# Domain-Specific Language Pattern
# Date: 30-Mar-2016
# Author.
# 		Eduardo Rodriguez Ruiz A01165829

def show(args)
	puts "Result = #{args}"
end

module Elements
	def +(*left)
		Jankepon.execute(self, left, true)
	end 
	def -(*left)
		Jankepon.execute(self, left, false)
	end
end

class Rock 
	extend Elements
end

class Paper 
	extend Elements
end

class Scissors 
	extend Elements
end
class Lizard 
	extend Elements
	
end
class Spock 
	extend Elements
end


class Jankepon
	def self.result(p1,p2,bool)
	if bool
		return p1
	end
	return p2
	end

	def self.execute(p1,left, bool)
		if left.count ==1
			p2 = left[0]
		end
        
		if bool
			res = "winner"
		else
			res = "loser"
		end

	if p1 == Scissors && p2 == Paper || p2 == Scissors && p1 == Paper
	  ret = result(Scissors,Paper,bool)
      puts "Scissors cut Paper (#{res} #{ret})"
      ret
    elsif p1 == Paper && p2 == Rock || p2 == Paper && p1 == Rock
      ret =result(Paper,Rock,bool)
      puts "Paper covers Rock (#{res} #{ret})"
      ret
    elsif p1 == Rock && p2 == Lizard || p2 == Rock && p1 == Lizard
      ret =result(Rock,Lizard,bool)
      puts "Rock crushes Lizard (#{res} #{ret})"
      ret
    elsif p1 == Lizard && p2 == Spock || p2 == Lizard && p1 == Spock
      ret =result(Lizard,Spock,bool)
      puts "Lizard poisons Spock (#{res} #{ret})"
      ret
    elsif p1 == Spock && p2 == Scissors || p2 == Spock && p1 == Scissors
      ret =result(Spock,Scissors,bool)
      puts "Spock smashes Scissors (#{res} #{ret})"
      ret
    elsif p1 == Scissors && p2 == Lizard || p2 == Scissors && p1 == Lizard
     ret = result(Scissors,Lizard,bool)
     puts "Scissors decapitate Lizard (#{res} #{ret})"
     ret
    elsif p1 == Lizard && p2 == Paper || p2 == Lizard && p1 == Paper
      ret =result(Lizard,Paper,bool)
      puts "Lizard eats Paper (#{res} #{ret})"
      ret
    elsif p1 == Paper && p2 == Spock || p2 == Paper && p1 == Spock
      ret =result(Paper,Spock,bool)
      puts "Paper disproves Spock (#{res} #{ret})"
      ret
    elsif p1 == Spock && p2 == Rock || p2 == Spock && p1 == Rock
      ret =result(Spock,Rock,bool)
      puts "Spock vaporizes Rock (#{res} #{ret})"
      ret
    elsif p1 == Rock && p2 == Scissors || p2 == Rock && p1 == Scissors
      ret =result(Rock,Scissors,bool)
      puts "Rock crushes Scissors (#{res} #{ret})"
      ret
    elsif p1 == p2
      puts "#{p1} tie (#{res} #{p1})"
      return p1
    end
	end
end





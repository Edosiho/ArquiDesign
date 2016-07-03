# Domain-Specific Language Pattern
# Date: 30-Mar-2016
# Authors:
#          A01165988 Azuri Gaytán Matrínez
#          A01165792 Diego Monroy Fraustro

class Matching
  
  def self.outcome(a, b, sign)
    if sign
      a
    else
      b
    end
  end
  
  def self.battle (a, other, n)
    
    b = nil
    if other.count == 1
      b = other[0]
    end
    
    outcome_phrase = nil
    if n
      outcome_phrase = "winner"
    else
      outcome_phrase = "loser"
    end
        
    if a == Scissors && b == Paper || b == Scissors && a == Paper
      outcome = outcome(Scissors, Paper, n)
      puts "Scissors cut Paper (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Paper && b == Rock || b == Paper && a == Rock
      outcome = outcome(Paper, Rock, n)
      puts "Paper covers Rock (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Rock && b == Lizard || b == Rock && a == Lizard
      outcome = outcome(Rock, Lizard, n)
      puts "Rock crushes Lizard (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Lizard && b == Spock || b == Lizard && a == Spock
      outcome = outcome(Lizard, Spock, n)
      puts "Lizard poisons Spock (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Spock && b == Scissors || b == Spock && a == Scissors
      outcome = outcome(Spock, Scissors, n)
      puts "Spock smashes Scissors (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Scissors && b == Lizard || b == Scissors && a == Lizard
      outcome = outcome(Scissors, Lizard, n)
      puts "Scissors decapitate Lizard (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Lizard && b == Paper || b == Lizard && a == Paper
      outcome = outcome(Lizard, Paper, n)
      puts "Lizard eats Paper (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Paper && b == Spock || b == Paper && a == Spock
      outcome = outcome(Paper, Spock, n)
      puts "Paper disproves Spock (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Spock && b == Rock || b == Spock && a == Rock
      outcome = outcome(Spock, Rock, n)
      puts "Spock vaporizes Rock (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == Rock && b == Scissors || b == Rock && a == Scissors
      outcome = outcome(Rock, Scissors, n)
      puts "Rock crushes Scissors (#{outcome_phrase} #{outcome})"
      outcome
    elsif a == b
      puts "#{a} tie (#{outcome_phrase} #{a})"
      a
    else
      "shit"
    end
  end
        
end

module MasterClass
  # Module for the + and - methods, extended for every new class
  def +(*other)
    Matching.battle(self, other, true)
  end
  
  def -(*other)
    Matching.battle(self, other, false)
  end
end

class Rock
  extend MasterClass
end

class Paper
  extend MasterClass
end

class Scissors 
  extend MasterClass
end

class Lizard 
  extend MasterClass
end

class Spock
  extend MasterClass
end

def show(args)
  puts "Result = #{args}"
end
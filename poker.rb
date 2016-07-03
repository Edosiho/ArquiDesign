require 'securerandom'
require 'pp'
class Poker
	def initialize
	@cards = ["2C","3C","4C","5C","6C","7C","8C","9C","10C","JC","QC","KC","AC",
		      "2D","3D","4D","5D","6D","7D","8D","9D","10D","JD","QD","KD","AD",
		  	  "2H","3H","4H","5H","6H","7H","8H","9H","10H","JH","QH","KH","AH",
		  	  "2S","3S","4S","5S","6S","7S","8S","9S","10S","JS","QS","KS", "AS"]
	end

 def createHand
 	hand =[]
 	while hand.size() != 5
 	 r= SecureRandom.random_number(52)
 	 if (!hand.find_index(r))
 	 	hand << r
 	 end
 	end
 	hand
 end

 def passToBin(hand)
 	hand.map! { |x| "%06b" % x}
 end

 def passToInt(hand)
 	hand.map! {|x| x.to_i(2)}
 end

 def getCards(hand)
 	temp = []
 	for i in 0...hand.count
 		temp[i] = @cards[hand[i]]
 	end
 	temp
 end

 def checkSuit(card)
 	(card)/13
 end

 def checkRank(card)
 	cardmod = card+1
 	cardmod%13
 end

 def isRoyal(hand)
 	if checkSuit(hand[0]) == checkSuit(hand[1]) && checkSuit(hand[0]) == checkSuit(hand[2]) &&checkSuit(hand[0]) == checkSuit(hand[3]) &&checkSuit(hand[0]) == checkSuit(hand[4])
 		if checkRank(hand[0]) == 9 && checkRank(hand[1]) == 10 && checkRank(hand[2]) == 11 && checkRank(hand[3]) == 12 && checkRank(hand[4]) == 0 
 		   true
 		 else
 		 	false
 		end 	
 	else
 		false
 	end
 end

 def isStraightFlush(hand)
	if checkSuit(hand[0]) == checkSuit(hand[1]) && checkSuit(hand[0]) == checkSuit(hand[2]) &&checkSuit(hand[0]) == checkSuit(hand[3]) &&checkSuit(hand[0]) == checkSuit(hand[4])
 		if checkRank(hand[0])+1 == checkRank(hand[1]) && checkRank(hand[0])+2 == checkRank(hand[2])&& checkRank(hand[0])+3 == checkRank(hand[3])&& checkRank(hand[0])+4 == checkRank(hand[4])  
 		   true
 		 else
 		 	false
 		end 	
 	else
 		false
 	end
 end

 def counter(hand)
 	count = Array.new(13,0)
 	for i in 0...hand.size()
 		count[checkRank(hand[i])] +=1;
 	end
 	count.sort()
 end

 def isFour(hand)
 	count = counter(hand)
 	if count.last == 4
 		true
 	else
 		false
 	end
 end

 def isFullHouse(hand)
 	count = counter(hand)
 	one = count.pop
 	two = count.pop
 	if one == 3 && two == 2
 		true
 	else
 		false
 	end
 end

 def isFlush(hand)
 	if checkSuit(hand[0]) == checkSuit(hand[1]) && checkSuit(hand[0]) == checkSuit(hand[2]) &&checkSuit(hand[0]) == checkSuit(hand[3]) &&checkSuit(hand[0]) == checkSuit(hand[4])
 		true
 	else
 		false
 	end	
 end

 def isStraight(hand)
 	valCards = []
 	for i in 0...hand.size()
 		valCards[i] = checkRank(hand[i])
 	end
 	valCards.sort()
 	if valCards[i] == 0
 		if (valCards[1] == 1 && valCards[2] == 2 && valCards[3] == 3  &&valCards[4] == 4) || (valCards[1] == 9 && valCards[2] == 10 && valCards[3] == 11  &&valCards[4] == 12)
 		 true
 		else
 		false
 	end

 	else
 		if valCards[0]+1 == valCards[1] && valCards[0]+2 == valCards[2]&&valCards[0]+3 == valCards[3]&& valCards[0]+4 == valCards[4]
 		   true
 		 else
 		 	false
 		end 	
 	end
 end

 def isThree(hand)
 	count = counter(hand)
 	one = count.pop
 	if one == 3
 		true
 	else
 		false
 	end
 end

 def isTwoPair(hand)
 	count = counter(hand)
 	one = count.pop
 	two = count.pop
 	if one == 2 && two == 2
 		true
 	else
 		false
 	end
 end

 def isPair(hand)
 	count = counter(hand)
 	one = count.pop
 	if one == 2
 		true
 	else
 		false
 	end
 end

 def validateHand(hand)
 	if hand.uniq.size() == 5
 		true
 	else
 		false
    end
 end

 def fitnessFunction(hand)
 	temp = hand.sort()
 	if isRoyal(temp)
 		1024
 	elsif isStraightFlush(temp)
 		256
 	elsif isFour(temp)
 		128
 	elsif isFullHouse(temp)
 		64
 	elsif isFlush(temp)
 		32
 	elsif isStraight(temp)
 		16
 	elsif isThree(temp)
 		8
 	elsif isTwoPair(temp)
 		4
 	elsif isPair(temp)
 		2
 	else
 		1
 	end
 end
end

class Genetic

	def initialize
		@set = []
		@poker = Poker.new

		for i in 0..21
			@set[i] =@poker.createHand
		end
	end

	def checkPob
		 @set.map! {|x| x.sort()}
		 similar = @set.uniq
		 if similar.count == 1 || similar.count ==2
		 	true
		 else
		 	false
		 end
	end

	def printSet
		temp = @set
		temp.map! { |x|  @poker.getCards(x)}
		pp temp
	end

	def getFitSum
		sum =0
		fits = []
		for i in 0...@set.size()
			sum += @poker.fitnessFunction(@set[i])
			fits[i] = @poker.fitnessFunction(@set[i])
		end
		#puts "Fitness Function Result: "

		sum

	end


	def reproduce
		temp = []
		mean = self.getFitSum.to_f
		fits = []
		for i in 0..@set.count-1
			fits[i] = @poker.fitnessFunction(@set[i])/mean
		end
		i=0
		while temp.size !=@set.size
			 r= SecureRandom.random_number(100) /100.0
			 if fits[i] >= r
			 	temp << @set[i]
			 end
			 i = (i+1)%6
		end
		#puts "Reproduction:"
		@set = temp

	end
	
	def cross
		temp = []
		i=0
		while temp.size != @set.size
			r= SecureRandom.random_number(5)
			temp1 =[]
			temp2 =[]
			arr1 = @set[i]
			arr2 = @set[i*2 % @set.size-1]
			#pp arr1
			
			for j in 0..4
				if i <= r
					temp1[j] = arr1[j]
					temp2[j] = arr2[j]
				else
					temp1[j] = arr2[j]
					temp2[j] = arr1[j]
				end
			end
			if @poker.validateHand(temp1) && @poker.validateHand(temp2)
				temp << temp1
				temp << temp2
			end
			i = (i+1)% (@set.size()/2)
		end
		#puts "CrossOver: "
		@set = temp
	end

	def xfactor(card)
		temp = card.clone
		for i in 0..5
			r= SecureRandom.random_number(100)
			if r < 2
				if card[i] = "0"
					card[i] = "1"
				else
					card[i] = "0"
				end
			end
		end
		if  card.to_i(2) <=52 
			card
		else
			temp
		end

	end

	def mutate
		 @set.map! {|x| @poker.passToBin(x)}

		 for i in 0..@set.size-1
		 	@set[i].map! {|x| xfactor(x)}
		 end
		 @set.map! {|x| @poker.passToInt(x)}
		 #puts "MUTATION:"
	end

	def breed
		generation = 100
		for i in 0..generation
			#puts "GENERATION #{i}: \n Original:"
			#pp @set
			
			self.reproduce
			#pp @set
			
			self.cross
			#pp @set

			self.mutate
			#pp @set
		end
		finalfits = []
		for i in 0..@set.count-1
			finalfits[i] = @poker.fitnessFunction(@set[i])
		end

		puts finalfits.sort.last

	end
end


gen = Genetic.new

#gen.reproduce

gen.breed

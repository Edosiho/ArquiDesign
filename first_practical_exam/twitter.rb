#==========================================================
#Eduardo Rodríguez Ruiz A01165829
#==========================================================

#==========================================================
# Code for question 2

#----------------------------------------------------------
# Place here your code for the Twitter class.
#----------------------------------------------------------
require 'observer'
class Twitter 
	include Observable

	attr_reader :name
	attr_accessor :followed
	def initialize(name)
	@name = name
	@followed = []
	end

	def tweet(comment)
		print @name + " just tweeted: #{comment}\n"
		changed
		notify_observers(comment,@name)
		
	end

	def follow(user)
		user.add_observer(self)
		return self
	end

	def update(comment,name)
		print @name + " received a tweet from #{name}: #{comment}\n"
	end

end
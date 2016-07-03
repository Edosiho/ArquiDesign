
# Adapter Pattern
# Date: 2-March-2016
# Authors:
#          A01165829 Eduardo Rodriguez Ruiz

class QueueAdapter
	attr_accessor :queue
	def initialize(q)
		@queue = q
	end

	def push(x)
		@queue.insert(x)
		self
	end

	def pop
		if @queue.empty?
		   nil
	    else
	    	arr = []
	    	until @queue.size ==0  do
	    		arr << @queue.remove
	    	end
	        temp = arr.pop
	        until arr.size == 0 do
	        	@queue.insert(arr.shift)
	        end
	    end
	    return temp
    end

    def peek
    	
    	if @queue.size == 0
			 nil
		else
			arr = []
	    	until @queue.size ==0  do
	    		arr << @queue.remove
	    	end
	        temp = arr[arr.size-1]
	        until arr.size == 0 do
	        	@queue.insert(arr.shift)
	        end
	    end
	    return temp
    end
    
    def empty?
    	return @queue.empty?
    end

    def size
    	return @queue.size
    end
end
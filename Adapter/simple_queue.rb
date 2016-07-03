# Adapter Pattern
# Date: 2-Marc-2016
# Authors:
#          A01165829 Eduardo Rodriguez Ruiz
# File: simple_queue.rb

# IMPORTANT: Do not modify the following class in any way!

class SimpleQueue

  def initialize
    @info =[]
  end

  def insert(x)
    @info.push(x)
    self
  end

  def remove
    if empty?
      raise "Can't remove if queue is empty"
    else
      @info.shift
    end
  end

  def empty?
    @info.empty?
  end

  def size
    @info.size
  end

  def inspect
    @info.inspect
  end
  
end 
require './simple_queue'
require './queue_adapter'

    q = SimpleQueue.new
    qa = QueueAdapter.new(q)
    puts q.empty?
   	puts qa.empty?
    puts qa.pop
    puts qa.push("Foo")
    puts q.size
    puts qa.size
    puts qa.peek
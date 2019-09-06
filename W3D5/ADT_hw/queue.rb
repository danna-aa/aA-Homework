class Queue

    private
    attr_reader :array

    def initialize
        @array = Array.new
    end

    def enqueue(el)
        @array << el
    end

    def dequeue
        @array.shift
    end

    def peek
        @array.first
    end
  
end
class Stack

    private
    attr_reader :array

    def initialize
        @array = Array.new
    end

    def push(el)
        @array << el
    end

    def pop
        @array.pop
    end

    def peek
        @array.last
    end

end

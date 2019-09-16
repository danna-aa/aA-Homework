class LinkedListNode

    attr_accessor :value, :nxt, :prv

    def initialize(value, nxt = nil, prv = nil)
        @value = value
        @nxt = nxt
        @prv = prv
    end

    def nxt=(value)
        @nxt = value
    end

    # def inspect
    #     {"value"=>@value, "next"=>@nxt, "previous"=>@prv}.inspect
    # end

end
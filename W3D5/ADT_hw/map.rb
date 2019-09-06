class Map

    private
    attr_reader :array

    # my_map = [[k1, v1], [k2, v2], [k3, v2]]

    def initialize
        @array = Array.new
    end

    def set(key, value)
        index_of_key = @array.index {|key_value_pair| key_value_pair.first == key}
        if !index_of_key
            @array << [key, value]
        else
            array[index_of_key] = [key, value]
        end
    end

    def get(key)
        @array.each do |key_value_pair|
            if key_value_pair.first == key
                return key_value_pair.last
            end
            
        end
        raise "key is not found"
    end

    def delete(key)
        @array.each_with_index do |key_value_pair, i|
            if key_value_pair.first == key
                @array.delete_at(i)
            end
        end
    end

    def show
        arr = @array.map {|ele| ele}
        return arr
    end

end
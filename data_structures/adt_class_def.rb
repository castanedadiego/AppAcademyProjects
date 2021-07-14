class Stack
    def initialize
        @values = []
    end

    def push(el)
        @values.push(el)
    end

    def pop
        @values.pop
    end

    def peek
        @values.last
    end

    private

    attr_reader :values
end

class Queue

    def initialize
        @values =[]
    end

    def enqueue(el)
        @values.push(el)
    end

    def dequeue
        @values.shift
    end

    def peek
        @values.first
    end

    private

    attr_reader :values

end


class Map

    def initialize
        @values = []
    end

    def get(key)
        @values.select {|pair| pair[0]== key}
    end

    def set(key, value)
        pair_index = @values.index {|pair| pair[0] == key}

        if pair_index
            @values[pair_index][1] = value
        else
            @values.push([key, value])
        end
    end

    def get(key)
        @values.each { |pair| return pair[1] if pair[0] == key}
        nil
    end

    def delete(key)
        self.get(key)
        @values.reject! {|pair| pair[0]== key}
    end

    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end

    def show
        deep_dup(underlying_array)
    end

    private
    attr_reader :values
end

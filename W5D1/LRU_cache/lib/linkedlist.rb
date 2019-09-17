require_relative "llnode"

class LinkedList

    attr_accessor :head

    def initialize
        @head = LinkedListNode.new(nil, nil, nil)
    end

    def list 
        current_node = @head
        arr = [current_node]
        until current_node.nxt == nil
            arr << current_node.nxt
            current_node = current_node.nxt
        end
        arr
    end

    def tail
        if @head.nxt == nil
            return @head
        end
        current_node = @head.nxt
        while current_node != nil
            last_node = current_node
            current_node = current_node.nxt
        end
        return last_node
    end

    def include?(node)
        current_node = @head.nxt
        while current_node != nil
            if node == current_node
                return true
            end
            current_node = current_node.nxt
        end
        false
    end

    def count 
        count = 0
        return 0 if @head.nxt == nil
        current_node = @head.nxt
        while current_node != nil
            count += 1
            current_node = current_node.nxt 
        end
        count
    end

    def length
        count
    end

    def push(node)
        last = self.tail
        last.nxt = node
        node.prv = last
        list
    end

    def <<(node)
        push(node)
    end

    def pop
        popped = tail
        new_last = tail.prv
        tail.prv = nil
        new_last.nxt = nil
        popped
    end

    def unshift(node)
        left_node = @head
        right_node = @head.nxt
        left_node.nxt = node
        node.prv = left_node
        right_node.prv = node
        node.nxt = right_node
        list
    end

    def shift
        deleted = @head.nxt
        next_node = deleted.nxt
        deleted.prv = nil
        deleted.nxt = nil
        @head.nxt = next_node
        next_node.prv = @head
        deleted
    end

    def insert(node, next_node)
        raise "list is empty" if @head.nxt == nil
        current_node = @head.nxt
        until current_node == next_node
            last_node = last_node.prv
            current_node = current_node.nxt
        end
        current_node.prv = node
        node.nxt = current_node
        last_node.nxt = node
        node.prv = last_node
    end

    def delete(node)
        current_node = @head
        until current_node == node
            last_node = current_node.prv
            next_node = current_node.nxt
        end
        last_node.nxt = next_node
        next_node.prv = last_node
        current_node.nxt = nil
        current_node.prv = nil
    end

    def inspect
        list
    end

end

ll = LinkedList.new
mario = LinkedListNode.new("mario")
ll << mario
# p ll.tail
# p ll.list
# p ll.tail

# # p ll.tail
luigi = LinkedListNode.new("luigi")
ll.push(luigi)
# # p ll.tail
peach = LinkedListNode.new("peach")
ll.push(peach)
# # p ll.tail
# # p ll.include?(luigi)
# # p ll.count
# # p ll.length
bowser = LinkedListNode.new("bowser")
ll << bowser
# # p ll
# # p ll.tail
# # mario = LinkedListNode.new("mario", nil, nil)
# # ll.push(mario)
# # p ll
# p ll.pop
# p ll.tail
p ll.list
toad = LinkedListNode.new("toad")
ll.unshift(toad)
p ll.list
p ll.shift
p ll.list
p ll
goomba = LinkedListNode.new("goomba")
ll.insert()
require_relative "llnode"

class LinkedList

    attr_accessor :head

    def initialize
        @head = LinkedListNode.new(nil, nil, nil)
    end

    def include?(node)
        current_node = @head
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
        current_node = @head
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
        current_node = @head
        until current_node == nil
            last_node = current_node
            current_node = current_node.nxt
        end
        last_node.nxt = node
        node.prv = last_node
    end

    def <<(node)
        push(node)
    end

    def pop
        current_node = @head
        until current_node == nil
            last_node = current_node
            two_nodes_before = last_node.prv
            current_node = current_node.next
        end
        last_node.nxt = nil
        last_node.prv = nil
        two_nodes_before.nxt = nil
    end

    def unshift(node)
        current_node = @head
        next_node = current_node.nxt
        @head.nxt = node
        node.prv = @head
        current_node.prv = node
        node.nxt = current_node
    end

    def shift
        deleted = @head.nxt
        next_node = deleted.nxt
        deleted.prv = nil
        deleted.nxt = nil
        @head.nxt = next_node
        next_node.prv = @head
    end

    def insert(node, next_node)
        current_node = @head
        until current_node == next_node
            last_node = last_node.prv
            current_node = current_node.next
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
            next_node = current_node.next
        end
        last_node.nxt = next_node
        next_node.prv = last_node
        current_node.nxt = nil
        current_node.prv = nil
    end

end

# ll = LinkedList.new
# p ll
# ll.push(LinkedListNode.new("mario"))
# p ll
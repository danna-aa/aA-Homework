class GraphNode

    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def inspect
        { "value"=>@value, "neighbors"=>@neighbors }.inspect
    end

    def bfs(starting_node, target_value)
        queue = [starting_node]
        visited = []
        until queue.empty?
            node = queue.shift
            if node.value == target_value
                return node
            elsif visited.include?(node)
                queue += []
            else
                visited << node
                node.neighbors.each do |nod|
                    queue << nod if !visited.include?(nod)
                end
            end
        end
        return nil
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p a.bfs(a, "b")
p a.bfs(a, "f")
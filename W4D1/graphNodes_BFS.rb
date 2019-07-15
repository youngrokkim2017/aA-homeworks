require 'set'

class GraphNode
    attr_accessor :val, :neighbors

    def initialize(value)
        self.value = value
        self.neighbors = []
    end

    def neighboring_node(node)
        self.neighbors << node
    end
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    curr_node = Set.new()

    while queue.length > 0
        node = queue.shift
        unless curr_node.include?(node)
            if node.value == target_value
                return node.value
            end

            curr_node.merge(node)
            queue += node.neighbors
        end
    end
    return nil
end
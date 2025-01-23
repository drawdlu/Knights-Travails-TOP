require_relative 'lib/node'

def knight_moves(vertex, goal, queue = [Node.new(vertex)])
  node = queue[0]
  moves = valid_moves(node)
  goal_found = goal_found(moves, goal)
  return goal_found unless goal_found.nil?

  record_moves(moves)

  moves.each { |move_node| queue.push(move_node) }

  queue.delete_at(0)
  knight_moves(vertex, goal, queue)
end

def valid_moves(node)
  possible_moves = [[1, 2], [2, 1], [-1, -2], [-2, -1],
                    [2, -1], [1, -2], [-2, 1], [-1, 2]]
  valid_arr = []

  possible_moves.each do |move|
    vertex = [node.vertex[0] + move[0], node.vertex[1] + move[1]]

    # record valid move only if it is valid and if it is not yet in @@recorded_vertex
    valid_arr.push(Node.new(vertex, node)) unless
    not_valid?(vertex) || Node.recorded_vertex.include?(vertex)
  end

  valid_arr
end

def not_valid?(move)
  return true unless move[0] >= 0 && move[0] <= 7 && move[1] >= 0 && move[1] <= 7

  false
end

def record_moves(moves)
  moves.each { |node| Node.recorded_vertex.push(node.vertex) }
end

def goal_found(moves, goal)
  moves.each do |node|
    return node if node.vertex == goal
  end

  nil
end

# test = Node.new([3, 3])
# valid_moves(test).each { |node| print "#{node.vertex} \n" }

print knight_moves([0, 0], [5, 6])
# Node.recorded_vertex.each { |vertex| print "#{vertex} \n" }

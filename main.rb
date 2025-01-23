require_relative 'lib/node'

def knight_moves(vertex, goal = nil, queue = [Node.new(vertex)])
  node = queue[0]
  moves = valid_moves(node)
  record_moves(moves)
end

def valid_moves(node)
  possible_moves = [[1, 2], [2, 1], [-1, -2], [-2, -1],
                    [2, -1], [1, -2], [-2, 1], [-1, 2]]
  valid_arr = []

  possible_moves.each do |move|
    vertex = [node.vertex[0] + move[0], node.vertex[1] + move[1]]
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

# test = Node.new([3, 3])
# valid_moves(test).each { |node| print "#{node.vertex} \n" }

knight_moves([3, 3])
Node.recorded_vertex.each { |vertex| print "#{vertex} \n" }

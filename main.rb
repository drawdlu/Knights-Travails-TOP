require_relative 'lib/node'

def knight_moves(initial, goal = nil, queue = [Node.new(initial)])
end

def valid_moves(node)
  possible_moves = [[1, 2], [2, 1], [-1, -2], [-2, -1],
                    [2, -1], [1, -2], [-2, 1], [-1, 2]]
  valid_arr = []

  possible_moves.each do |move|
    vertex = [node.vertex[0] + move[0], node.vertex[1] + move[1]]
    valid_arr.push(Node.new(vertex, node)) if valid?(vertex)
  end

  valid_arr
end

def valid?(move)
  return true if move[0] >= 0 && move[0] <= 7 && move[1] >= 0 && move[1] <= 7

  false
end

test = Node.new([3, 3])
valid_moves(test).each { |node| print "#{node.vertex} \n" }

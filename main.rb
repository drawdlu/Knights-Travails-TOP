require_relative 'lib/node'

def knight_moves(vertex, goal, queue = [Node.new(vertex)])
  node = queue[0]
  moves = valid_moves(node)
  goal_node = find_goal(moves, goal)
  return print_path(goal_node) unless goal_node.nil?

  record_moves(moves)

  moves.each { |move_node| queue.push(move_node) }

  queue.delete_at(0)
  knight_moves(vertex, goal, queue)
end

def valid_moves(node)
  possible_moves = [[1, 2], [2, 1], [-1, -2], [-2, -1],
                    [2, -1], [1, -2], [-2, 1], [-1, 2]].freeze
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

def find_goal(moves_arr, goal_vertex)
  moves_arr.each do |node|
    return node if node.vertex == goal_vertex
  end

  nil
end

def get_path(node)
  path = []

  until node.nil?
    path.push(node.vertex)
    node = node.parent_node
  end

  path.reverse
end

def print_path(node)
  path = get_path(node)
  num_moves = path.length - 1

  puts "You made it in #{num_moves} moves! Here's your path:"

  path.each { |vertex| print "#{vertex}\n" }
end

knight_moves([0, 0], [7, 7])

# You made it in 6 moves! Here's your path:
# [0, 0]
# [1, 2]
# [2, 4]
# [3, 6]
# [5, 7]
# [6, 5]
# [7, 7]

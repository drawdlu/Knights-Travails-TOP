# A possible move for a knight from initial vertex
class Node
  @@recorded_vertex = []

  attr_reader :vertex

  def initialize(vertex, parent_vertex = nil)
    @vertex = vertex
    @valid_moves = []
    @parent_vertex = parent_vertex
  end
end

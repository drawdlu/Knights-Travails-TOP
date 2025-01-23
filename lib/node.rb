# A possible move for a knight from initial vertex
class Node
  attr_reader :vertex, :parent_node

  @@recorded_vertex = []

  def initialize(vertex, parent_node = nil)
    @vertex = vertex
    @parent_node = parent_node
  end

  def self.recorded_vertex
    @@recorded_vertex
  end

  def self.recorded_vertex=(vertices)
    @@recorded_vertex = vertices
  end

  def to_s
    @vertex
  end
end

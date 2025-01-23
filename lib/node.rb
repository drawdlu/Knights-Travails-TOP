# A possible move for a knight from initial vertex
class Node
  attr_reader :vertex

  @@recorded_vertex = []

  def initialize(vertex, parent_vertex = nil)
    @vertex = vertex
    @parent_vertex = parent_vertex
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

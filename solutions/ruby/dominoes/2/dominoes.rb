require 'set'

module Dominoes
  def Dominoes.chain?(dominoes)
    return dominoes[0][0] == dominoes[0][1] if dominoes.length == 1
    return true if dominoes.empty?
    adjacency = {}
    dominoes.each do |domino|
      small, big = domino.sort
      (adjacency[small] ||= []) << big
      (adjacency[big] ||= []) << small
    end
    
    graph = adjacency.transform_values { |v| v.uniq }
    visited = Set.new
    queue = [graph.keys.first]
    visited << queue.first
    until queue.empty?
      current_node = queue.shift
      graph[current_node].each do |neighbor|
        queue.push(neighbor) if visited.add?(neighbor)
      end
    end
    return false if visited.length != graph.keys.length # not fully connected
    
    adjacency.all? { |_, neighbors| neighbors.length.even?} # eulerian cycle
  end
end
// Copyright (c) 2017 NUS CS3217. All rights reserved.

/**
 A generator that returns the nodes in the graph in depth-first search order,
 starting at the given node.

 - Authors: CS3217
 - Date: 2017
 */
struct DepthFirstOrderGenerator<Key: Hashable, Value: Collection> : IteratorProtocol, Sequence where Value.Iterator.Element == Key {
    
    var stack = Stack<Key>()
    var visited = [Key]()
    var position = -1

    /// Constructs a `DepthFirstOrderGenerator` with the given graph and start
    /// node.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    ///   - start: The start node.
    init(graph: Dictionary<Key, Value>, start: Key) {
        depthFirstSearch(graph: graph, current: start)
    }
    
    mutating func depthFirstSearch(graph: Dictionary<Key, Value>, current: Key) {
        visited.append(current)
        
        for neighbor in graph[current]!{
            if !visited.contains(neighbor) {
                depthFirstSearch(graph: graph, current: neighbor)
            }
        }
    }

    func makeIterator() -> DepthFirstOrderGenerator<Key, Value> {
        return self
    }

    mutating func next() -> Key? {
        position += 1
        
        guard position < visited.count else {
            return nil
        }
        
        return visited[position]
    }
}

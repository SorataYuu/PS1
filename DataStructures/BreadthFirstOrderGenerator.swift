// Copyright (c) 2017 NUS CS3217. All rights reserved.

/**
 A generator that returns the nodes in the graph in breadth-first search order,
 starting at the given node.

 - Authors: CS3217
 - Date: 2017
 */
struct BreadthFirstOrderGenerator<Key: Hashable, Value: Collection> : IteratorProtocol, Sequence where Value.Iterator.Element == Key {
    
    var queue = Queue<Key>()
    var visited = [Key]()
    var position = -1

    /// Constructs a `BreadthFirstOrderGenerator` with the given graph and start
    /// node.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    ///   - start: The start node.
    /// - Handling of Unconnected Graph:
    ///   - Extract out unvisited keys
    ///   - Sort by number of neighbours, visit node with highest number of neighbours first
    ///   - Gives highest probability of visiting more unvisited nodes
    ///   - These nodes are appended to the back of the BFS Order
    init(graph: Dictionary<Key, Value>, start: Key) {
        
        breadthFirstSearch(graph: graph, start: start)
        
        var unvisitedKeys = [Key]()
        
        for key in graph.keys {
            if !visited.contains(key){
                unvisitedKeys.append(key)
            }
        }
        
        unvisitedKeys = unvisitedKeys.sorted(by: {firstElement, secondElement in return graph[firstElement]!.count > graph[secondElement]!.count})
        
        for key in unvisitedKeys {
            if !visited.contains(key){
                breadthFirstSearch(graph: graph, start: key)
            }
        }
    }
    
    mutating func breadthFirstSearch(graph: Dictionary<Key, Value>, start: Key) {
        queue.enqueue(start)
        
        while !queue.isEmpty {
            let current = try? queue.dequeue()
            
            guard !visited.contains(current!) else {
                continue
            }
            
            visited.append(current!)
            
            for neighbor in graph[current!]!{
                if !visited.contains(neighbor) {
                    queue.enqueue(neighbor)
                }
            }
        }
    }

    func makeIterator() -> BreadthFirstOrderGenerator<Key, Value> {
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

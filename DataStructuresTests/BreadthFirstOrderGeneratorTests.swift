// Copyright (c) 2017 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class BreadthFirstOrderGeneratorTests : XCTestCase {

    func testCyclicGraph() {
        let graphFileName = "graph_cycle"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "C", "D"],
            "The BFS for \(graphFileName) is wrong!")
    }

    func testLinkedListGraph() {
        let graphFileName = "graph_linkedlist"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "C", "D", "E"],
            "The BFS for \(graphFileName) is wrong!")
    }

    func testExampleGraph() {
        let graphFileName = "graph_example"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "C", "E", "D", "F", "G"],
            "The BFS for \(graphFileName) is wrong!")
    }
    
    func testEmptyGraph() {
        let graphFileName = "graph_empty"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "0"),
                       ["0"],
                       "The BFS for \(graphFileName) is wrong!")
    }
    
    func testDirectedUnconnectedGraph() {
        let graphFileName = "graph_directed_unconnected"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "0"),
                       ["0", "1", "2", "4", "3"],
                       "The BFS for \(graphFileName) is wrong!")
    }
    
    func testDirectedGraph() {
        let graphFileName = "graph_directed_example1"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "0"),
                       ["0", "1", "5", "2", "4", "3"],
                       "The BFS for \(graphFileName) is wrong!")
    }

    private func getResultantNodesForGraph(_ fileName: String, startNode: String) -> [String] {
        // You do not need to modify this function.
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")!
        let graph = NSDictionary(contentsOfFile: path)!
        let bfsGenerator = BreadthFirstOrderGenerator(graph: graph as! Dictionary<String, Array<String>>, start: startNode)

        var nodes = [String]()
        for node in bfsGenerator {
            nodes.append(node as String)
        }
        return nodes
    }
}

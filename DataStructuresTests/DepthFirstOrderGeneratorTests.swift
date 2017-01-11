// Copyright (c) 2017 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class DepthFirstOrderGeneratorTests : XCTestCase {

    func testCyclicGraph() {
        let graphFileName = "graph_cycle"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "D", "C"],
            "The DFS for \(graphFileName) is wrong!")
    }

    func testLinkedListGraph() {
        let graphFileName = "graph_linkedlist"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "C", "D", "E"],
            "The DFS for \(graphFileName) is wrong!")
    }

    func testExampleGraph() {
        let graphFileName = "graph_example"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "D", "F", "E", "C", "G"],
            "The DFS for \(graphFileName) is wrong!")
    }
    
    func testEmptyGraph() {
        let graphFileName = "graph_empty"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "0"),
                       ["0"],
                       "The DFS for \(graphFileName) is wrong!")
    }
    
    func testDirectedUnconnectedGraph() {
        let graphFileName = "graph_directed_unconnected"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "0"),
                       ["0", "1", "2", "4", "3"],
                       "The DFS for \(graphFileName) is wrong!")
    }
    
    func testDirectedGraph() {
        let graphFileName = "graph_directed_example1"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "0"),
                       ["0", "1", "2", "4", "3", "5"],
                       "The DFS for \(graphFileName) is wrong!")
    }
    
    func testDirectedGraph2() {
        let graphFileName = "graph_directed_example2"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "0"),
                       ["0", "1", "5", "4", "2", "3"],
                       "The DFS for \(graphFileName) is wrong!")
    }

    private func getResultantNodesForGraph(_ fileName: String, startNode: String) -> [String] {
        // You do not need to modify this function.
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")!
        let graph = NSDictionary(contentsOfFile: path)!
        let dfsGenerator = DepthFirstOrderGenerator(graph: graph as! Dictionary<String, Array<String>>, start: startNode)

        var nodes = [String]()
        for node in dfsGenerator {
            nodes.append(node as String)
        }
        return nodes
    }
}

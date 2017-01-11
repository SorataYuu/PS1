// Copyright (c) 2017 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class QueueTests : XCTestCase {

    func testEnqueue() {
        var queue = Queue<String>()
        queue.enqueue("1")

        XCTAssertEqual(queue.toArray(), ["1"], "The item is not enqueued correctly!")
    }

    func testDequeue() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        queue.enqueue("3")
        
        try XCTAssertEqual(queue.dequeue(), "1", "The item is not dequeued correctly!")
        try XCTAssertEqual(queue.dequeue(), "2", "The item is not dequeued correctly!")
    }

    func testPeek() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        queue.enqueue("3")
        
        try XCTAssertEqual(queue.peek(), "1", "The item is not peeked correctly!")
        try XCTAssertEqual(queue.peek(), "1", "The item is not peeked correctly!")
    }

    func testCount() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        queue.enqueue("3")
        XCTAssertEqual(queue.count, 3, "The queue's length is not correct!");
    }

    func testIsEmpty() {
        var queue = Queue<String>()
        
        XCTAssertEqual(queue.isEmpty, true, "The queue does not check emptiness correctly!")
        
        queue.enqueue("1")
        
        XCTAssertEqual(queue.isEmpty, false, "The queue does not check emptiness correctly!")
        
        let _ = try? queue.dequeue()
        
        XCTAssertEqual(queue.isEmpty, true, "The queue does not check emptiness correctly!")
    }

    func testRemoveAll() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        queue.enqueue("3")
        
        queue.removeAll()
        XCTAssertEqual(queue.isEmpty, true, "The queue does not removeAll() correctly!")
    }

    func testToArray() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        queue.enqueue("3")
        
        XCTAssertEqual(queue.toArray(), ["1", "2", "3"], "The queue does not toArray() correctly!")
    }
}

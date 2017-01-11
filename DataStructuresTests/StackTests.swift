// Copyright (c) 2017 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class StackTests : XCTestCase {

    func testPush() {
        var stack = Stack<Int>()
        stack.push(1)

        XCTAssertEqual(stack.toArray(), [1], "The item is not pushed correctly!")
    }

    func testPop() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        try XCTAssertEqual(stack.pop(), 3, "The item is not popped correctly!")
        try XCTAssertEqual(stack.pop(), 2, "The item is not popped correctly!")
        try XCTAssertEqual(stack.pop(), 1, "The item is not popped correctly!")
    }

    func testPeek() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        try XCTAssertEqual(stack.peek(), 3, "The item is not peeked correctly!")
        try XCTAssertEqual(stack.peek(), 3, "The item is not peeked correctly!")
    }

    func testCount() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.count, 3, "The stack's length is not correct!");
    }

    func testIsEmpty() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.isEmpty, true, "The stack's emptiness is not correct!");
        
        stack.push(1)
        XCTAssertEqual(stack.isEmpty, false, "The stack's emptiness is not correct!");
        
        let _ = try? stack.pop()
        
        XCTAssertEqual(stack.isEmpty, true, "The stack's emptiness is not correct!");
        
    }

    func testRemoveAll() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.removeAll()
        XCTAssertEqual(stack.isEmpty, true, "The stack's removeAll() is not correct!");
        
    }

    func testToArray() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.toArray(), [3,2,1], "The stack's toArray() is not correct!");
    }
}

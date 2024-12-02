//
//  NodeDepths.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 01/12/2024.
//

/*
    ** Prompt **
 
    The distance between a a node in a Binary Tree and the tree's node is called the node's depth.
 
    Write a function that takes in a Binary Tree and returns the sum of its node's depths.
 
    Each `Binary Tree` node has an integer `value`, a `left`, and a `right` child node.
 
    Children nodes can be `BinaryTree` nodes themselves or non/nil.
 
 */

import XCTest

class NodeDepthsEngine {
    func calculate() -> Bool {
        true
    }
}

final class NodeDepths: XCTestCase {
    func test_nodeDepthsEngine_firstTestReturnsTrue() {
        let sut = NodeDepthsEngine()
        
        XCTAssertEqual(sut.calculate(), true)
    }
}

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
@testable import AlgoPlayground

class NodeDepthsEngine {
    func nodeDepths(_ root: BinaryTree?, _ depth: Int = 0) -> Int {
        guard let root else { return 0 }
        
        return depth + nodeDepths(root.left, depth + 1) + nodeDepths(root.right, depth + 1)
    }
}

final class NodeDepths: XCTestCase {
    func test_nodeDepthsEngine_firstTestReturns16() {
        let sut = makeSUT()
        let root = makeRootNode1()
        
        let result = sut.nodeDepths(root)
        
               
        XCTAssertEqual(result, 16)
    }
    
    func test_nodeDepthsEngine_firstTestReturns10() {
        let sut = makeSUT()
        let root = makeRootNode2()
        
        let result = sut.nodeDepths(root)
        
               
        XCTAssertEqual(result, 10)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> NodeDepthsEngine {
        NodeDepthsEngine()
    }
    
    private func makeRootNode1() -> BinaryTree {
        //         1
        //       /   \
        //      2     3
        //     / \   / \
        //    4   5 6   7
        //   / \
        //  8   9
        
        let node9 = BinaryTree(value: 9)
        let node7 = BinaryTree(value: 7)
        let node6 = BinaryTree(value: 6)
        let node8 = BinaryTree(value: 8)
        let node4 = BinaryTree(value: 4, left: node8, right: node9)
        let node5 = BinaryTree(value: 5)
        let node2 = BinaryTree(value: 2, left: node4, right: node5)
        let node3 = BinaryTree(value: 3, left: node6, right: node7)
        let rootNode = BinaryTree(value: 1, left: node2, right: node3)
        
        return rootNode
    }
    
    private func makeRootNode2() -> BinaryTree {
        //         1
        //       /   \
        //      2     3
        //     / \   / \
        //    4   5 6   7
        
        let node7 = BinaryTree(value: 7)
        let node6 = BinaryTree(value: 6)
        let node4 = BinaryTree(value: 4)
        let node5 = BinaryTree(value: 5)
        let node2 = BinaryTree(value: 2, left: node4, right: node5)
        let node3 = BinaryTree(value: 3, left: node6, right: node7)
        let rootNode = BinaryTree(value: 1, left: node2, right: node3)
        
        return rootNode
    }
}

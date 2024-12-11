//
//  FindClosestValue.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 11/12/2024.
//

/*
    ** Prompt **
    
    Write a function that takes in a Binary Search Tree (BST) and a target integer value
    and returns the closest value to that target value contained in the BST.
 
    You can assume that there will only be one closest value.
 
    Each `BST` node has an integer `value`, a `left` child node, and a `right` child node.
    A node is said to be a valid `BST` node if and only if it satisfies the BST property
    which is: its `value` is strictly greater than the values of every node to its left;
    its `value` is less than or equal to the values of every node to its right; and its
    children nodes are either valid `BST` nodes themselves or `None/nil`.
 
 */

import XCTest
@testable import AlgoPlayground

class ClosestValueEngine {
    // TODO: Not implemented yet.
    func find(_ tree: BinaryTree) -> Int {
        
        return 1
    }
}

final class FindClosestValue: XCTestCase {
    // TODO: Not implemented yet.
    func test_closestValue_returns12() {
        let sut = ClosestValueEngine()
        let tree = makeSampleInput()
        
        let result = sut.find(tree)
        
        XCTAssertEqual(result, 1)
    }
    
    // MARK: Helpers.
    
    private func makeSampleInput() -> BinaryTree {
        
        //         10
        //       /    \
        //      5      15
        //     / \    /  \
        //    2   5  13   22
        //   /        \
        //  1          14
        
        let node9 = BinaryTree(value: 14)
        let node8 = BinaryTree(value: 1)
        let node7 = BinaryTree(value: 22)
        let node6 = BinaryTree(value: 13, right: node9)
        let node5 = BinaryTree(value: 5)
        let node4 = BinaryTree(value: 2, left: node8)
        let node3 = BinaryTree(value: 15, left: node6, right: node7)
        let node2 = BinaryTree(value: 5, left: node4, right: node5)
        let tree = BinaryTree(value: 10, left: node2, right: node3)
        
        return tree
    }
}

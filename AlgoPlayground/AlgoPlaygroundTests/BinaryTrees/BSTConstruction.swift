//
//  BSTConstruction.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 11/12/2024.
//

/*
    ** Prompt **
 
    Write a BST class for a Binary Search Tree.
    The class should support:
 
    - Inserting values with the `insert` method.
    - Removing values with the `remove` method; this method should only remove
        the first instance of a given value.
    - Searching for values with the `contains` method.
 
    Note that you can't remove values from a single-node tree.
    In other words, calling the `remove`method on a single-node tree should simply not do anything.
 
    Each `BST`node has an integer `value`, a `left` child node, and a `right` child node.
    A node is said to be a valid `BST` node if and only if it satisfies..
    
    The BST property:
        Its `value` is strictly greater than the values of every node to its left;
        its `value` is less than or equal to the values of every node to its right;
        and its children nodes are either valid BST nodes themselves or `None/null/nil`.
 
 */

import XCTest
@testable import AlgoPlayground

final class BSTConstruction: XCTestCase {
    // The constructor must have 3 methods.
        // Insert
        // Search
        // Delete
    
    func test_bstConstructInsert_succeed() {
        // Given
        let node1 = BinaryTree(value: 10)
        let sut = makeSUT(node1)
        
        // When
        let receivedResult = sut.insert(5)
        
        // Then
        
        let expectedAddedNode = BinaryTree(value: 5)
        let expectedResult = BinaryTree(value: 10, left: expectedAddedNode)
        
        XCTAssertEqual(
            receivedResult.left?.value,
            expectedResult.left?.value,
            "Expected \(expectedResult.left?.value ?? 0) received: \(receivedResult.left?.value ?? 0)"
        )
    }
    
    // MARK: - Helpers
    
    private func makeSUT(_ node: BinaryTree) -> BinaryTree {
        BinaryTree(value: node.value)
    }
}

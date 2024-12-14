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
    
    func test_bstConstruct_InsertLowerGoesToLeft() {
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
        
        XCTAssertEqual(receivedResult.value, expectedResult.value)
        XCTAssertEqual(receivedResult.right?.value, expectedResult.right?.value)
    }
    
    func test_bstConstruct_insertGreaterGoesToRight() {
        // Given
        let node1 = BinaryTree(value: 10)
        let sut = makeSUT(node1)
        
        // When
        let receivedResult = sut.insert(15)
        
        // Then
        let expectedAddedNode = BinaryTree(value: 15)
        let expectedResult = BinaryTree(value: 10, right: expectedAddedNode)
        
        XCTAssertEqual(
            receivedResult.right?.value,
            expectedResult.right?.value,
            "Expected \(expectedResult.right?.value ?? 0) received: \(receivedResult.right?.value ?? 0)"
        )
        
        XCTAssertEqual(receivedResult.value, expectedResult.value)
        XCTAssertEqual(receivedResult.left?.value, expectedResult.left?.value)
    }
    
    // MARK: - Contains Tests
    
    func test_bstConstruct_containsNodeValueReturnSuccess() {
        // Given
        let rootNode = BinaryTree(value: 10)
        let sut = makeSUT(rootNode)
        
        // When
        let node = BinaryTree(value: 10)
        
        // Then
        XCTAssertEqual(sut.search(node.value), true)
    }
    
    func test_bstConstruct_containsLeftNodeValueReturnSuccess() {
        let rootNode = BinaryTree(value: 10)
        let sut = makeSUT(rootNode)
        
        let insertResultBST = sut.insert(3)
        
        XCTAssertEqual(insertResultBST.search(3), true)
    }
    
    func test_bstConstruct_containsRightNodeValueReturnSuccess() {
        let rootNode = BinaryTree(value: 10)
        let sut = makeSUT(rootNode)
        
        let insertResultBST = sut.insert(15)
        
        XCTAssertEqual(insertResultBST.search(15), true)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(_ node: BinaryTree) -> BinaryTree {
        BinaryTree(value: node.value)
    }
}

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

class BSTConstructionEngine {
    func construct() -> Bool {
        true
    }
}

final class BSTConstruction: XCTestCase {
    func test_bstConstruct_returnsTrue() {
        let sut = BSTConstructionEngine()
        
        XCTAssertEqual(sut.construct(), true)
    }
}

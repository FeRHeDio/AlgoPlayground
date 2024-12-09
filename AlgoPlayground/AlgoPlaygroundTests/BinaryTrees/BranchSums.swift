//
//  BranchSums.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 20/11/2024.
//

/*
    ** Prompt **
 
    Write a function that takes in a Binary Tree and returns a list of its branch sums
    ordered from leftmost branch sum to rightmost branch sum.
 
    A branch sum is the sum of all values in a Binary Tree branch. A Binary Tree branch 
    is a path of nodes in a tree that starts at the root node and ends at any leaf node.
 
    Each BinaryTree node has an integer value, a left child node, and a right child node. 
    Children nodes can either be BinaryTree nodes thmeselves or nil
 
 */

import XCTest
@testable import AlgoPlayground

// MARK: - O(n) Time - O(N) Space

class BranchSumsEngine {
    func branchSums(root: BinaryTree) -> [Int] {
        var sums = [Int]()
        calculateBranchSums(node: root, runningSum: 0, sums: &sums)
        
        return sums
    }
    
    func calculateBranchSums(node: BinaryTree, runningSum: Int, sums: inout [Int]) {
        let newRunningSum = runningSum + node.value
        
        if node.left == nil && node.right == nil {
            sums.append(newRunningSum)
            return
        }
        
        if let left = node.left {
            calculateBranchSums(node: left, runningSum: newRunningSum, sums: &sums)
        }
        
        if let right = node.right {
            calculateBranchSums(node: right, runningSum: newRunningSum, sums: &sums)
        }
    }
}

final class BranchSums: XCTestCase {
    func test_binaryTree_calculateSums() {
        let root = makeFirstTree()
        let sut = makeSUT()
        
        let result = sut.branchSums(root: root)
        let expectedResult = [15, 16, 8, 10, 11]
        
        XCTAssertEqual(result, expectedResult)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> BranchSumsEngine {
        BranchSumsEngine()
    }
    
    private func makeFirstTree() -> BinaryTree {
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
}

//
//  BranchSums.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 20/11/2024.
//

/*
    ** Prompt **
 
    Write a function that takes in a Binary Tree and returns a list of its branch sums ordered from leftmost branch sum to rightmost branch sum.
 
    A branch sum is the sum of all values in a Binary Tree branch. A Binary Tree branch is a path of nodes in a tree that starts at the root node and ends at any leaf node.
 
    Each BinaryTree node has an integer value, a left child node, and a right child node. Children nodes can either be BinaryTree nodes thmeselves or nil
 
 */

import XCTest
@testable import AlgoPlayground

// MARK: - O(n) Time - O(N) Space

class BranchSumsEngine {
    func branchSums(root: TreeNode) -> [Int] {
        var sums = [Int]()
        calculateBranchSums(node: root, runningSum: 0, sums: &sums)
        
        return sums
    }
    
    func calculateBranchSums(node: TreeNode, runningSum: Int, sums: inout [Int]) {
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
    
    private func makeFirstTree() -> TreeNode {
        //         1
        //       /   \
        //      2     3
        //     / \   / \
        //    4   5 6   7
        //   / \
        //  8   9
        
        let node9 = TreeNode(id: "9", value: 9)
        let node7 = TreeNode(id: "7", value: 7)
        let node6 = TreeNode(id: "6", value: 6)
        let node8 = TreeNode(id: "8", value: 8)
        let node4 = TreeNode(id: "4", value: 4, left: node8, right: node9)
        let node5 = TreeNode(id: "5", value: 5)
        let node2 = TreeNode(id: "2", value: 2, left: node4, right: node5)
        let node3 = TreeNode(id: "3", value: 3, left: node6, right: node7)
        let rootNode = TreeNode(id: "1", value: 1, left: node2, right: node3)
        
        return rootNode
    }
}

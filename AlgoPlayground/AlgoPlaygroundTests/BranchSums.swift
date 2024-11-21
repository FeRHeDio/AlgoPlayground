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

class BinaryTree {
    var value: Int
    
    var left: BinaryTree?
    var right: BinaryTree?
    
    init(value: Int, left: BinaryTree? = nil, right: BinaryTree? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func branchSums(root: BinaryTree) -> [Int] {
        var sums = [Int]()
        calculateBranchSums(node: root, runningSum: 0, sums: &sums)
        
        return sums
    }
    
    func calculateBranchSums(node: BinaryTree, runningSum: Int, sums: inout [Int]) {
        var newRunningSum = runningSum + node.value
        
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

    

}

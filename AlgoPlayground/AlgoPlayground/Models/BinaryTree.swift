//
//  TreeNode.swift
//  AlgoPlayground
//
//  Created by Fernando Putallaz on 03/12/2024.
//

import Foundation

// MARK: - Common Binary Tree model.

class BinaryTree {
    var value: Int
    var left: BinaryTree?
    var right: BinaryTree?
    
    init(value: Int, left: BinaryTree? = nil, right: BinaryTree? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    // MARK: - Complexity Analysis:
        // Average: O(Log(n)) Time - O(1) Space
        // Worst: O(n) Time - O(1) Space
    
    func insert(_ value: Int) -> BinaryTree {
        var currentNode = self
        
        while true {
            if value < currentNode.value {
                if let left = currentNode.left {
                    currentNode = left
                } else {
                    currentNode.left = BinaryTree(value: value)
                    break
                }
            } else {
                if let right = currentNode.right {
                    currentNode = right
                } else {
                    currentNode.right = BinaryTree(value: value)
                    break
                }
            }
        }
        
        return self
    }
    
    func search(_ value: Int?) -> Bool {
        guard let value else { return false }
        
        var currentNode: BinaryTree? = self
        
        while let node = currentNode {
            if value == node.value {
                return true
            } else if value < node.value {
                currentNode = node.left
            }
        }
        return false
    }
}

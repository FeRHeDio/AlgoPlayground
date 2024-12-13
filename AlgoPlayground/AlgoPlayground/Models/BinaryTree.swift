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
}

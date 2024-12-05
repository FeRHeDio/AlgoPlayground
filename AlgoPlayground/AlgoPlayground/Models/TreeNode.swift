//
//  TreeNode.swift
//  AlgoPlayground
//
//  Created by Fernando Putallaz on 03/12/2024.
//

import Foundation

// MARK: - Common Binary Tree model.

class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

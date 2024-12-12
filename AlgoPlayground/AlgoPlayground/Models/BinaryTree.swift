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
        return self
    }
}

//
//  EvaluateExpression.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 03/12/2024.
//

/*
    ** Prompt **
 
    You're given a binary expression tree. Write a function to evaluate this tree mathematically and return a single resulting integer.
 
    All leaf nodes in the tree represent operands, which will always be positive integers.
    All of the other nodes represent operators. There are 4 operators supported, each of which is represented by a negative integer.:
 
    -1: Addition operator, adding the left and right subtrees.
    -2: Subtraction operator, subtracting the right subtree from the left subtree.
    -3: Division operator, dividing the left subtree by the right subtree. If the result is a decimal, it should be rounded towards zero.
    -4: Multiplication operator, multiplying the left and right subtrees.
 
    You can assume the tree will always be a valid expression tree. Each operator also works as a grouping symbol, meaning the bottom of
    the tree is always evaluated first, regardless of the operator.
 
 */

import XCTest
@testable import AlgoPlayground

class EvaluateExpressionEngine {
    func evaluate(_ tree: TreeNode) -> Int {
        if tree.value >= 0 {
            return tree.value
        }
        
        let leftValue = evaluate(tree.left!)
        let rightValue = evaluate(tree.right!)
        
        switch tree.value {
            case -1:
                return leftValue + rightValue
                
            case -2:
                return leftValue - rightValue
                
            case -3:
                return leftValue / rightValue
            
            default: return leftValue * rightValue
        }
    }
}

final class EvaluateExpression: XCTestCase {
    func test_evaluateExpressionEnginge_returnsTrue() {
        let sut = makeSUT()
        
        let rootNode = makeTree()
        let result = sut.evaluate(rootNode)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_evaluateExpression_returnsSingleLeafNode() {
        let sut = makeSUT()
        let tree = TreeNode(id: "1", value: 33)
        
        XCTAssertEqual(sut.evaluate(tree), 33)
    }
    
    func test_evaluateExpression_returnsAddition() {
        let sut = makeSUT()
        
        let node3 = TreeNode(id: "3", value: 3)
        let node2 = TreeNode(id: "2", value: 2)
        let tree = TreeNode(id: "1", value: -1, left: node2, right: node3)
        
        XCTAssertEqual(sut.evaluate(tree), 5)
    }
    
    func test_evaluateExpression_returnsSubtraction() {
        let sut = makeSUT()
        
        let node3 = TreeNode(id: "3", value: 3)
        let node2 = TreeNode(id: "2", value: 10)
        let tree = TreeNode(id: "1", value: -2, left: node2, right: node3)
        
        XCTAssertEqual(sut.evaluate(tree), 7)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> EvaluateExpressionEngine {
        EvaluateExpressionEngine()
    }
    
    private func makeTree() -> TreeNode {
        //        -1
        //       /   \
        //     -2    -3
        //     / \   / \
        //   -4  2  8   3
        //   / \
        //  2   3
        
        let node9 = TreeNode(id: "9", value: 3)
        let node8 = TreeNode(id: "8", value: 2)
        let node5 = TreeNode(id: "5", value: 2)
        let node4 = TreeNode(id: "4", value: -4, left: node8, right: node9)
        let node7 = TreeNode(id: "7", value: 3)
        let node6 = TreeNode(id: "6", value: 8)
        let node2 = TreeNode(id: "2", value: -2, left: node4, right: node5)
        let node3 = TreeNode(id: "3", value: -3, left: node6, right: node7)
        let rootNode = TreeNode(id: "1", value: -1, left: node2, right: node3)
        
        return rootNode
    }
}

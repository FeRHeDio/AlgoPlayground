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
    
    // MARK: O(n) Time - O(h) Space, where n is the number of nodes in the tree and h is the height of the tree.
    
    func evaluate(_ tree: BinaryTree) -> Int {
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
            
                if rightValue == 0 {  // division by zero
                    return 0
                } else {
                    return leftValue / rightValue
                }
                
            default: return leftValue * rightValue
        }
    }
}

final class EvaluateExpression: XCTestCase {
    func test_evaluateExpressionEnginge_returnsSix() {
        let sut = makeSUT()
        
        let rootNode = makeTreeForSix()
        let result = sut.evaluate(rootNode)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_evaluateExpression_returnsSingleLeafNode() {
        let sut = makeSUT()
        let tree = BinaryTree(value: 33)
        
        XCTAssertEqual(sut.evaluate(tree), 33)
    }
    
    func test_evaluateExpression_returnsAddition() {
        let sut = makeSUT()
        
        let node3 = BinaryTree(value: 3)
        let node2 = BinaryTree(value: 2)
        let tree = BinaryTree(value: -1, left: node2, right: node3)
        
        XCTAssertEqual(sut.evaluate(tree), 5)
    }
    
    func test_evaluateExpression_returnsSubtraction() {
        let sut = makeSUT()
        
        let node3 = BinaryTree(value: 3)
        let node2 = BinaryTree(value: 10)
        let tree = BinaryTree(value: -2, left: node2, right: node3)
        
        XCTAssertEqual(sut.evaluate(tree), 7)
    }
    
    func test_evaluateExpression_returnsDivision() {
        let sut = makeSUT()
        
        let node3 = BinaryTree(value: 2)
        let node2 = BinaryTree(value: 10)
        let tree = BinaryTree(value: -3, left: node2, right: node3)
        
        XCTAssertEqual(sut.evaluate(tree), 5)
    }
    
    func test_evaluateExpression_returnsDivisionRounded() {
        let sut = makeSUT()
        
        let node3 = BinaryTree(value: 2)
        let node2 = BinaryTree(value: 11)
        let tree = BinaryTree(value: -3, left: node2, right: node3)
        
        XCTAssertEqual(sut.evaluate(tree), 5)
    }
    
    func test_evaluateExpression_returnsDivisionByZeroThrows() {
        let sut = makeSUT()
        
        let node3 = BinaryTree(value: 0)
        let node2 = BinaryTree(value: 10)
        let tree = BinaryTree(value: -3, left: node2, right: node3)
        
        XCTAssertEqual(sut.evaluate(tree), 0)
    }
    
    func test_evaluateExpression_returnsMultiplication() {
        let sut = makeSUT()
        
        let node3 = BinaryTree(value: 2)
        let node2 = BinaryTree(value: 11)
        let tree = BinaryTree(value: -4, left: node2, right: node3)
        
        XCTAssertEqual(sut.evaluate(tree), 22)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> EvaluateExpressionEngine {
        EvaluateExpressionEngine()
    }
    
    private func makeTreeForSix() -> BinaryTree {
        //        -1
        //       /   \
        //     -2    -3
        //     / \   / \
        //   -4  2  8   3
        //   / \
        //  2   3
        
        let node9 = BinaryTree(value: 3)
        let node8 = BinaryTree(value: 2)
        let node5 = BinaryTree(value: 2)
        let node4 = BinaryTree(value: -4, left: node8, right: node9)
        let node7 = BinaryTree(value: 3)
        let node6 = BinaryTree(value: 8)
        let node2 = BinaryTree(value: -2, left: node4, right: node5)
        let node3 = BinaryTree(value: -3, left: node6, right: node7)
        let rootNode = BinaryTree(value: -1, left: node2, right: node3)
        
        return rootNode
    }
}

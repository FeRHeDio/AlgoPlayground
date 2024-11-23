//
//  Fibonacci.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 22/11/2024.
//

/*
    ** Prompt **
    
    The Fibonacci Sequence is defined as follows: The first number of the sequence is 0, the second number is 1, and the nth number is the sum of the (n-1)th and (n-2)nth numbers.
    
    Write a function that takes in an integer n and returns the Nth Fibonacci number.
 
    Important Note: The Fibonacci sequence is often defined with its first two numbers as F0 = 0 and F1 = 1.
    For the purpose of this question, the first Fibonacci number is F0; therefore, getNthFib(1) is equal to F0, getNthFib(2) is equal to F1, and so on.
    
 */

import XCTest

class FibonacciEngine {
    
    func getNthFib(n: Int) -> Int {
        
        if n == 2 {
            return 1
        } else if n == 1 {
            return 0
        } else {
            return getNthFib(n: n - 1) + getNthFib(n: n - 2)
        }
    }
 }

final class Fibonacci: XCTestCase {
    
    func test_fibonacci_takesTwoReturnsOne() {
        let sut = FibonacciEngine()
        
        let result = sut.getNthFib(n: 2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacci_takesOneReturnsZero() {
        let sut = FibonacciEngine()
        
        let result = sut.getNthFib(n: 1)
        
        XCTAssertEqual(result, 0)
    }

   

}

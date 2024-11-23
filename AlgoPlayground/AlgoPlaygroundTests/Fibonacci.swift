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
 
    The subsequent number should be like this:
    
     F(1) = 0 (1st Fibonacci value)
     F(2) = 1 (2nd Fibonacci value)
     F(3) = 1 (3rd Fibonacci value)
     F(4) = 2 (4th Fibonacci value)
     F(5) = 3 (5th Fibonacci value)
     F(6) = 5 (6th Fibonacci value)
     F(7) = 8 (7th Fibonacci value)
     F(8) = 13 (8th Fibonacci value)
        
    
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
    
    func test_fibonacci_takes3Returns2() {
        let sut = FibonacciEngine()
        
        let result = sut.getNthFib(n: 3)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacci_takes5Returns3() {
        let sut = FibonacciEngine()
        
        let result = sut.getNthFib(n: 5)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_fibonacci_takes6Returns5() {
        let sut = FibonacciEngine()
        
        let result = sut.getNthFib(n: 6)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_fibonacci_takes7Returns8() {
        let sut = FibonacciEngine()
        
        let result = sut.getNthFib(n: 7)
        
        XCTAssertEqual(result, 8)
    }
    
    func test_fibonacci_takes8Returns13() {
        let sut = FibonacciEngine()
        
        let result = sut.getNthFib(n: 8)
        
        XCTAssertEqual(result, 13)
    }
    


}

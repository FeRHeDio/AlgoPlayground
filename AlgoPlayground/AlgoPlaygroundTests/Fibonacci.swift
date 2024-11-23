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
    
    // MARK: Naive approach - O(2^n) Time - O(n) Space
    func getNthFib(n: Int) -> Int {
        if n == 2 {
            return 1
        } else if n == 1 {
            return 0
        } else {
            return getNthFib(n: n - 1) + getNthFib(n: n - 2)
        }
    }
    
    //getNthFibWithMemoize(n: n - 1) + getNthFibWithMemoize(n: n - 2)
    func getNthFibWithMemoize(n: Int) -> Int {
        var memo = [Int: Int]()
        
        if n == 1 { return 0 }
        if n == 2 { return 1 }
        
        if let cached = memo[n] {
            return cached
        }
        
        let result = getNthFibWithMemoize(n: n - 1) + getNthFibWithMemoize(n: n - 2)
        
        memo[n] = result
        return result
    }
}

final class Fibonacci: XCTestCase {
    
    func test_fibonacci_takesTwoReturnsOne() {
        let sut = makeSUT()
        
        let result = sut.getNthFib(n: 2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacci_takesOneReturnsZero() {
        let sut = makeSUT()
        
        let result = sut.getNthFib(n: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_fibonacci_takes3Returns2() {
        let sut = makeSUT()
        
        let result = sut.getNthFib(n: 3)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacci_takesNforPerformanceTest(n: Int) {
        let sut = makeSUT()
        
        _ = sut.getNthFib(n: n)
    }
    
    //MARK: Tests for getNthFibWithMemoize approach
    
    func test_fibonacciGetNthFibWithMemoize_takesTwoReturnsOne() {
        let sut = makeSUT()
        
        let result = sut.getNthFibWithMemoize(n: 2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacciGetNthFibWithMemoize_takesOneReturnsZero() {
        let sut = makeSUT()
        
        let result = sut.getNthFibWithMemoize(n: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_fibonacciGetNthFibWithMemoize_takes3Returns2() {
        let sut = makeSUT()
        
        let result = sut.getNthFibWithMemoize(n: 3)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacciGetNthFibWithMemoize_takesNforPerformanceTest(n: Int) {
        let sut = makeSUT()
        
        _ = sut.getNthFibWithMemoize(n: n)
    }
    
    
    func test_fibonacciGetNthFibWithMemoize_takes8Returns13() {
        let sut = makeSUT()
        
        let result = sut.getNthFibWithMemoize(n: 8)
        
        XCTAssertEqual(result, 13)
    }
    
    
    //MARK: - Helpers
    
    private func makeSUT() -> FibonacciEngine {
        FibonacciEngine()
    }
    
    //MARK: - Performance
    
    // WARNING: Do not enter larger numbers for this algo which will take a long time to execute.
    func testFibonnacciNaiveApproach() throws {
        self.measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
            test_fibonacci_takesNforPerformanceTest(n: 16)
        }
    }
    
    func testFibonnacciMemoApproach() throws {
        self.measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
            test_fibonacciGetNthFibWithMemoize_takesNforPerformanceTest(n: 16)
        }
    }

}

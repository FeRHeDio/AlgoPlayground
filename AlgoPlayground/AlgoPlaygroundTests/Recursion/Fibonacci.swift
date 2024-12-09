//
//  Fibonacci.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 22/11/2024.
//

/*
    ** Prompt **
    
    The Fibonacci Sequence is defined as follows: The first number of the sequence is 0, 
    the second number is 1, and the nth number is the sum of the (n-1)th and (n-2)nth numbers.
    
    Write a function that takes in an integer n and returns the Nth Fibonacci number.
 
    Important Note: The Fibonacci sequence is often defined with its first two numbers 
    as F0 = 0 and F1 = 1.
    For the purpose of this question, the first Fibonacci number is F0; therefore, getNthFib(1) 
    is equal to F0, getNthFib(2) is equal to F1, and so on.
 
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

// MARK: - Naive Approach - O(2^n) Time - O(n) Space
class FibonacciEngine {
    func getNthFib(number: Int) -> Int {
        if number == 2 {
            return 1
        } else if number == 1 {
            return 0
        } else {
            return getNthFib(number: number - 1) + getNthFib(number: number - 2)
        }
    }
}

// MARK: Tests for naive approach
final class Fibonacci: XCTestCase {
    func test_fibonacci_takesTwoReturnsOne() {
        let sut = makeSUT()
        
        let result = sut.getNthFib(number: 2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacci_takesOneReturnsZero() {
        let sut = makeSUT()
        
        let result = sut.getNthFib(number: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_fibonacci_takes3Returns2() {
        let sut = makeSUT()
        
        let result = sut.getNthFib(number: 3)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacci_takesNforPerformanceTest(number: Int) {
        let sut = makeSUT()
        
        _ = sut.getNthFib(number: number)
    }
}

// MARK: - Memoize Approach - O(n) Time  O(n) Space
extension FibonacciEngine {
    func getNthFibWithMemoize(number: Int) -> Int {
        var memo = [Int: Int]()
        
        if number == 1 { return 0 }
        if number == 2 { return 1 }
        
        if let cached = memo[number] {
            return cached
        }
        
        let result = getNthFibWithMemoize(number: number - 1) + getNthFibWithMemoize(number: number - 2)
        
        memo[number] = result
        return result
    }
}

// MARK: Tests for getNthFibWithMemoize approach
extension Fibonacci {
    func test_fibonacciGetNthFibWithMemoize_takesTwoReturnsOne() {
        let sut = makeSUT()
        
        let result = sut.getNthFibWithMemoize(number: 2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacciGetNthFibWithMemoize_takesOneReturnsZero() {
        let sut = makeSUT()
        
        let result = sut.getNthFibWithMemoize(number: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_fibonacciGetNthFibWithMemoize_takes3Returns2() {
        let sut = makeSUT()
        
        let result = sut.getNthFibWithMemoize(number: 3)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_fibonacciGetNthFibWithMemoize_takesNforPerformanceTest(number: Int) {
        let sut = makeSUT()
        
        _ = sut.getNthFibWithMemoize(number: number)
    }
    
    func test_fibonacciGetNthFibWithMemoize_takes8Returns13() {
        let sut = makeSUT()
        
        let result = sut.getNthFibWithMemoize(number: 8)
        
        XCTAssertEqual(result, 13)
    }
}

// MARK: - Iterative Approach - O(n) Time  O(1) Space
extension FibonacciEngine {
    func getNthFibIterative(number: Int) -> Int {
        var lastTwo = [0, 1]
        var counter = 3
        
        while counter <= number {
            let nextFib = lastTwo[0] + lastTwo[1]
            lastTwo[0] = lastTwo[1]
            lastTwo[1] = nextFib
            
            counter += 1
        }
        
        if number > 1 {
            return lastTwo[1]
        } else {
           return lastTwo[0]
        }
    }
}

// MARK: Tests for getNthFibIterative approach
extension Fibonacci {
    func test_getNthFibIterative_takesTwoReturnsOne() {
        let sut = makeSUT()
        
        let result = sut.getNthFibIterative(number: 2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_getNthFibIterative_takesOneReturnsZero() {
        let sut = makeSUT()
        
        let result = sut.getNthFibIterative(number: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_getNthFibIterative_takes3Returns2() {
        let sut = makeSUT()
        
        let result = sut.getNthFibIterative(number: 3)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_getNthFibIterative_takes8Returns13() {
        let sut = makeSUT()
        
        let result = sut.getNthFibIterative(number: 8)
        
        XCTAssertEqual(result, 13)
    }
    
    func test_getNthFibIterative_takesNforPerformanceTest(number: Int) {
        let sut = makeSUT()
        
        _ = sut.getNthFibIterative(number: number)
    }
}

// MARK: - Helpers
extension Fibonacci {
    private func makeSUT() -> FibonacciEngine {
        FibonacciEngine()
    }
    
    // MARK: - Performance
    // WARNING: Do not enter larger numbers for this algo which will take a long time to execute.
    func testFibonnacciNaiveApproach() throws {
        self.measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
            test_fibonacci_takesNforPerformanceTest(number: 16)
        }
    }
    
    func testFibonnacciMemoApproach() throws {
        self.measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
            test_fibonacciGetNthFibWithMemoize_takesNforPerformanceTest(number: 16)
        }
    }
    
    func testFibonnaccigetNthFibIterative() throws {
        self.measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
            test_getNthFibIterative_takesNforPerformanceTest(number: 16)
        }
    }
}

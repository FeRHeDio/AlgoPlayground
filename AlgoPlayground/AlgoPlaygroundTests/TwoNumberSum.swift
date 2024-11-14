//
//  TwoNumberSum.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 14/11/2024.
//

/*
 
    ** Prompt **
 
    Write a function that takes a non-empty array of distinct integers and an integer representing
    a target sum.
    
    If any two numbers in the input array sum up to the target sum, the function should return them in an array, in any order.
    
    If no two numbers sum up the target number, the function should return an empty array.
    
    Note that the target sum has to be obtained by summing two different integers in the array, you can't add a single integer
    to itself in order to obtain the target sum.
    
 */
 
import XCTest

class TwoNumberSumEngine {
    
    func findNumbersWithAnotherCollection(array: [Int], target: Int) -> [Int] {
        guard !array.isEmpty else { return [] }
        
        return []
    }
    
    
    // MARK: - O(n^2) time - O(1) Space
    
    func findNumbersWithTwoForLoops(array: [Int], target: Int) -> [Int] {
        guard !array.isEmpty else { return [] }
        
        var result = [Int]()
        
        for i in array {
            for y in array {
                if i + y == target {
                    result.append(i)
                    result.append(y)
                    
                    return result
                }
            }
        }
        
        return []
    }
 }

final class TwoNumberSum: XCTestCase {
    func test_twoNumberSum_fiundNumbersWithTwoForLoops() {
        let sut = makeSUT()
        
        let array = [1, -9, -1, 11, 21]
        let target = 10
        
        let result = sut.findNumbersWithTwoForLoops(array: array, target: target)
        
        XCTAssertEqual(result, [-1, 11])
    }
    
    func test_twoNumberSum_FailFiundindNumbersWithTwoForLoops() {
        let sut = makeSUT()
        
        let array = [1, -9, -21, 11, 21]
        let target = 10
        
        let result = sut.findNumbersWithTwoForLoops(array: array, target: target)
        
        XCTAssertEqual(result, [], "There are no 2 numbers that sum up to 10, received: \(result) instead")
    }
    
    func test_twoNumberSum_returnsOnEmptyArray() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.findNumbersWithTwoForLoops(array: [], target: 0), [])
    }
    
    func test_twoNumberSum_funcWithCollectionReturnsOnEmptyArray() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.findNumbersWithAnotherCollection(array: [], target: 0), [])
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> TwoNumberSumEngine {
        TwoNumberSumEngine()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

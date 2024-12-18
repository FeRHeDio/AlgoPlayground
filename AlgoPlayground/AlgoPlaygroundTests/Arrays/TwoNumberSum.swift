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
    
    If any two numbers in the input array sum up to the target sum, the function should return 
    them in an array, in any order.
    
    If no two numbers sum up the target number, the function should return an empty array.
    
    Note that the target sum has to be obtained by summing two different integers in the array, 
    you can't add a single integer
    to itself in order to obtain the target sum.
 */
 
import XCTest

class TwoNumberSumEngine {
    
    // MARK: - O(n Log(n)) time - O(1) Space
    
    func findTwoNumbersSum(array: [Int], target: Int) -> [Int] {
        guard !array.isEmpty else { return [] }
        
        let ordered = array.sorted() // O(n Log(n))
        
        var lidx = 0
        var ridx = ordered.count - 1
        
        while lidx < ridx {
            let current = ordered[lidx] + ordered[ridx]
            
            if current == target {
                return [ordered[lidx], ordered[ridx]]
            } else
            
            if current < target {
                lidx += 1
            } else
            
            if current > target {
                ridx -= 1
            }
        }
        
        return []
    }
 }

final class TwoNumberSum: XCTestCase {
    // MARK: Tests for `findTwoNumberSum` func
    
    func test_twoNumberSum_funcWithCollectionReturnsOnEmptyArray() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.findTwoNumbersSum(array: [], target: 0), [])
    }
    
    func test_twoNumberSum_twoNumberSum() {
        let sut = makeSUT()
        
        let array = [1, -9, -1, 11, 21]
        let target = 10
        
        let result = sut.findTwoNumbersSum(array: array, target: target)
        
        XCTAssertEqual(result, [-1, 11])
    }
    
    func test_twoNumberSum_twoNumberSumReturnsOnEmptyArray() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.findTwoNumbersSum(array: [], target: 0), [])
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> TwoNumberSumEngine {
        TwoNumberSumEngine()
    }
}

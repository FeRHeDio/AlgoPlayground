//
//  InsertionSort.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 26/11/2024.
//

/*
    ** Prompt **
 
    Write a function that takes in an array of integers and returns a sorted version of that array.
 
    Use the insertion sort algorithm to sort the array.
 
    Hint: Divide the array into two subarrays in place. The first subarray should be sorted at all times and
    should start with the length of one, while the second subarray should be unsorted.
    
    Iterate throught the unsorted subarray, inserting all of its elements into the sorted subarray in the
    correct position by swapping them into place.
    
    Eventually the whole array will be sorted.
 */

import XCTest

class InsertionSortEngine {
    
    //MARK: - O(n^2) Time - O(1) Space.
    
    func insertionSort(_ array: inout [Int]) -> [Int] {
        for idx in array.indices {
            var jdx = idx
            
            while jdx > 0 && array[jdx] < array[jdx - 1] {
                array.swapAt(jdx, jdx - 1)
                jdx -= 1
            }
        }
        
        return array
    }
}

final class InsertionSort: XCTestCase {
    func test_insertionSort_returnsFirstSortedArray() {
        let sut = makeSUT()
        var array = [2, 4, 3, 9, 9, 1]
        
        let result = sut.insertionSort(&array)
        
        XCTAssertEqual(result, array.sorted())
    }
    
    func test_insertionSort_returnsSecondSortedArray() {
        let sut = makeSUT()
        var array = [-4, 5, 10, 8, -10, -6, -4, -2, -5, 3, 5, -4, -5, -1, 1, 6, -7, -6, -7, 8]
        
        let result = sut.insertionSort(&array)
        
        XCTAssertEqual(result, array.sorted())
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> InsertionSortEngine {
        InsertionSortEngine()
    }
}

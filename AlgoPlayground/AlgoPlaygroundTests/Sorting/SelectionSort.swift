//
//  SelectionSort.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 09/12/2024.
//

/*
 
    Write a function that takes in an array of integers and returns a sorted version of the array.
    Use Selection Sort algorithm to sort the array.
 
 */

import XCTest

class SelectionSortEngine {
    
    // MARK: O(n^2) Time - O(1) Space
    
    func selectionSort(_ array: inout [Int]) {
        var currentIdx = 0

        while currentIdx < array.count - 1 {
            var smallestIdx = currentIdx
            
            for idx in (currentIdx + 1)..<array.count {
                if array[smallestIdx] > array[idx] {
                    smallestIdx = idx
                }
            }
            array.swapAt(currentIdx, smallestIdx)
            currentIdx += 1
        }
    }
}

final class SelectionSort: XCTestCase {
    func test_selectionSort_returnsTrue() {
        let sut = makeSUT()
        var array = [3, 1, 6, 2, 9]
        
        sut.selectionSort(&array)
        
        XCTAssertEqual(array, [1, 2, 3, 6, 9] )
    }
    
    func test_selectionSort_largeArray() {
        let sut = makeSUT()
        var array = [5, -2, 2, -8, 3, -10, -6, -1, 2, -2, 9, 1, 1]
        
        sut.selectionSort(&array)
        
        XCTAssertEqual(array, [-10, -8, -6, -2, -2, -1, 1, 1, 2, 2, 3, 5, 9])
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> SelectionSortEngine {
        SelectionSortEngine()
    }
}

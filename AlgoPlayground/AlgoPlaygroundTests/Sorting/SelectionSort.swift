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
        let sut = SelectionSortEngine()
        var array = [3, 1, 6, 2, 9]
        
        sut.selectionSort(&array)
        
        XCTAssertEqual(array, [1, 2, 3, 6, 9] )
    }
}

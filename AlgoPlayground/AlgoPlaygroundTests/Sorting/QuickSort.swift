//
//  QuickSort.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 11/11/2024.
//

/*
    ** Prompt **
    Write a function that takes an array of integers and returns a sorted version of that array using the 
    Qucick Sort Algorithm
 
 */

import XCTest

// MARK: - Worst case: O(n^2) Time - Best Case: O(N.Log(n))  -  O(Log(n)) - Space

class QuickSortEngine {
    func quickSort( _ array: inout [Int]) -> [Int] {
        quickSortHelper(array: &array, startIdx: 0, endIdx: array.count - 1)
        return array
    }
    
    // MARK: - Helpers
    
    func quickSortHelper(array: inout [Int], startIdx: Int, endIdx: Int) {
        if startIdx >= endIdx {
            return
        }
        
        let pidx = startIdx
        var lidx = startIdx + 1
        var ridx = endIdx
        
        while ridx >= lidx {
            if array[lidx] > array[pidx] && array[ridx] < array[pidx] {
                array.swapAt(ridx, lidx)
            }
            
            if array[lidx] <= array[pidx] {
                lidx += 1
            }
            
            if array[ridx] >= array[pidx] {
                ridx -= 1
            }
        }
        
        array.swapAt(pidx, ridx)
        
        let leftSubArrayIsSmaller = array[ridx] - 1 - startIdx < endIdx - (array[ridx] + 1)
        
        if leftSubArrayIsSmaller {
            quickSortHelper(array: &array, startIdx: startIdx, endIdx: ridx - 1)
            quickSortHelper(array: &array, startIdx: ridx + 1, endIdx: endIdx)
        } else {
            quickSortHelper(array: &array, startIdx: ridx + 1, endIdx: endIdx)
            quickSortHelper(array: &array, startIdx: startIdx, endIdx: ridx - 1)
        }
    }
}

final class QuickSort: XCTestCase {
    func test_quickSort() {
        let sut = makeSUT()
        var inputArray = [9, 3, 2, 4, 12, 32, 7, 3, 25, 41, 88, 1, 3]
        
        let result = sut.quickSort(&inputArray)
        
        XCTAssertEqual(result, inputArray.sorted())
    }
    
    func test_helper_returnsOnStartIdxGreaterThanEndIdx() {
        let sut = makeSUT()
        var array = [2, 1, 5]
        
        sut.quickSortHelper(array: &array, startIdx: 5, endIdx: array.endIndex - 1)
        
        XCTAssertEqual(
            array,
            [2, 1, 5],
            "The array shouldn't change because the startIdx is greater that endIdx and received this: \(array)"
        )
    }

    // MARK: - Helpers
    
    private func makeSUT() -> QuickSortEngine {
        QuickSortEngine()
    }
}

//
//  QuickSort.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 11/11/2024.
//

/*
    ** Prompt **
 
    Write a function that takes an array of integers and returns a sorted version of that array using the Qucick Sort Algorithm
 
 */

import XCTest


// MARK: Pseudo

/*
 // check if the startidx is greater or equal to the endidx
     // if so return
 
 // define the pivot
 // define lidx
 // define ridx
 
 // while ridx >= lidx
     // if lidx > pidx && ridx < pidx
         // if so swap ridx and lidx
 
     // if lidx <= pidx
         // lidx += 1
 
     // if ridx >= pidx
         // ridx -= 1
 
 // swap pidx for ridx
 
 // then we need to define the smaller subarray.
 
 // var leftSubarrayIsSmaller = ridx - 1 - startIdx < endIdx - (ridx + 1)
 
 // if leftSubarrayIsSamller
     // call itself again on the smaller subarray
     // quickSortHelper(array, startIdx, ridx - 1)
     // quickSortHelper(array, ridx + 1, endIdx
 
     // else
         // quickSortHelper(array, ridx + 1, endIdx
         // quickSortHelper(array, startIdx, ridx - 1)
*/

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
        
        XCTAssertEqual(array, [2, 1, 5], "The array shouldn't change because the startIdx is greater that endIdx and received this: \(array)")
    }

    // MARK: - Helpers
    
    private func makeSUT() -> QuickSortEngine {
        QuickSortEngine()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            
        }
    }

}

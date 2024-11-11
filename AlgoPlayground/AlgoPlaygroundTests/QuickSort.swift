//
//  QuickSort.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 11/11/2024.
//

import XCTest


// MARK: Pseudo

/*
 // check if the sartidx is greater or equal to the endidx
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
    func quickSort(_ array: [Int]) -> [Int] {
        quickSortHelper(array: array, startIdx: 0, endIdx: array.count - 1)
    }
    
    // MARK: - Helpers
    
    func quickSortHelper(array: [Int], startIdx: Int, endIdx: Int) -> [Int] {
        
        
        return [0, 1]
    }
}

final class QuickSort: XCTestCase {
    
    func test_helper_startIdxIsNotGreaterThanEndIdx() {
        let sut = QuickSortEngine()
        let inputArray = [1]
        
        let result = sut.quickSortHelper(array: inputArray, startIdx: 0, endIdx: inputArray.count - 1)
        
        XCTAssertGreaterThanOrEqual(0, result.count - 1)
    }

//    func test_quickSort() {
//        let sut = QuickSortEngine()
//        let inputArray = [9, 3, 2, 4, 12, 32, 7, 3, 25, 41, 88, 1, 3]
//        
//        let result = sut.quickSort(inputArray)
//        
//        XCTAssertEqual(result, inputArray.sorted())
//        
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

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
    
    func sort() -> Bool {
        return true
    }
}

final class InsertionSort: XCTestCase {
    func test_initial_returnTrue() {
        let sut = InsertionSortEngine()
        
        XCTAssertEqual(sut.sort(), true)
    }
}

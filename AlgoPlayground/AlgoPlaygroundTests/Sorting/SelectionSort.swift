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
    func sort() -> Bool {
        true
    }
}

final class SelectionSort: XCTestCase {
    func test_selectionSort_returnsTrue() {
        let sut = SelectionSortEngine()
        
        XCTAssertEqual(sut.sort(), true)
    }
}

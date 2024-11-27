//
//  InsertionSort.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 26/11/2024.
//

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

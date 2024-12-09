//
//  SelectionSort.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 09/12/2024.
//

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

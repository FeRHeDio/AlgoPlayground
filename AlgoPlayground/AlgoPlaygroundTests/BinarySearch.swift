//
//  BinarySearch.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 09/11/2024.
//

import XCTest

class BinarySearchEngine {
    func search(_ number: Int) -> Int {
        return 1
    }
}

final class BinarySearch: XCTestCase {
    
    func test_searchForNumber1_returnsNumberOne() {
        let sut = BinarySearchEngine()
        let targetNumber = 1
    
        let result = sut.search(targetNumber)
        
        XCTAssertEqual(targetNumber, result)
    }

    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

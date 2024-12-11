//
//  FindClosestValue.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 11/12/2024.
//

import XCTest

class ClosestValueEngine {
    func find() -> Bool {
        true
    }
}

final class FindClosestValue: XCTestCase {
    func test_closestValue_returnsTrue() {
        let sut = ClosestValueEngine()
        
        XCTAssertEqual(sut.find(), true)
    }
}

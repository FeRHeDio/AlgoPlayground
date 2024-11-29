//
//  OptimalFreelancing.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 28/11/2024.
//

import XCTest

class OptimalFreelancingEngine {
    func calculate() -> Bool {
        true
    }
}


final class OptimalFreelancing: XCTestCase {
    func test_optimalFreelancing_returnsTrue() {
        let sut = OptimalFreelancingEngine()
        
        XCTAssertEqual(sut.calculate(), true)
    }
}

//
//  TandemBicycle.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 30/11/2024.
//

import XCTest

class TandemBicycleEngine {
    func calculate() -> Bool {
        true
    }
}

final class TandemBicycle: XCTestCase {
    func test_tandemBicycle_returns() {
        let sut = TandemBicycleEngine()
        
        XCTAssertEqual(sut.calculate(), true)
    }
}

//
//  MinimumWaitingTime.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 26/11/2024.
//

import XCTest

class WaitingTimeEngine {
    func returnTrue() -> Bool {
        true
    }
}

final class MinimumWaitingTime: XCTestCase {
    func test_waitingTime_firstTest() {
        let sut = WaitingTimeEngine()
        
        XCTAssertTrue(sut.returnTrue())
    }
}

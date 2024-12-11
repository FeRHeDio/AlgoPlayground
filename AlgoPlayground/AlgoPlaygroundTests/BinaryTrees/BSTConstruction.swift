//
//  BSTConstruction.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 11/12/2024.
//

import XCTest

class BSTConstructionEngine {
    func construct() -> Bool {
        true
    }
}

final class BSTConstruction: XCTestCase {
    func test_bstConstruct_returnsTrue() {
        let sut = BSTConstructionEngine()
        
        XCTAssertEqual(sut.construct(), true)
    }
}

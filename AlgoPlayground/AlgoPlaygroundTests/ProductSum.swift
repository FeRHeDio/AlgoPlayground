//
//  ProductSum.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 28/11/2024.
//

import XCTest

class ProductSumEngine {
    func solve() -> Bool {
        true
    }
}

final class ProductSum: XCTestCase {
    func test_productSumEngine_returnsTrue() {
        let sut = ProductSumEngine()
        
        XCTAssertEqual(sut.solve(), true)
    }
}

//
//  EvaluateExpression.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 03/12/2024.
//

import XCTest
@testable import AlgoPlayground

class EvaluateExpressionEngine {
    func evaluate() -> Bool {
        true
    }
}


final class EvaluateExpression: XCTestCase {
    func test_evaluateExpressionEnginge_returnsTrue() {
        let sut = EvaluateExpressionEngine()
        
        XCTAssertEqual(sut.evaluate(), true)
    }
}

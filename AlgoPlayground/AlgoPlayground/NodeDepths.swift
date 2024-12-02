//
//  NodeDepths.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 01/12/2024.
//

import XCTest

class NodeDepthsEngine {
    func calculate() -> Bool {
        true
    }
}

final class NodeDepths: XCTestCase {
    func test_nodeDepthsEngine_firstTestReturnsTrue() {
        let sut = NodeDepthsEngine()
        
        XCTAssertEqual(sut.calculate(), true)
    }
}

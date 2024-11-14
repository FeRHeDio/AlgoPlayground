//
//  TwoNumberSum.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 14/11/2024.
//

import XCTest

class TwoNumberSumEngine {
    func findNumbersTwoForLoops(array: [Int], target: Int) -> [Int] {
        var result = [Int]()
        
        for i in array {
            for y in array {
                if i + y == target {
                    result.append(i)
                    result.append(y)
                    return result
                }
            }
        }
        
        return []
    }
 }

final class TwoNumberSum: XCTestCase {
    
    func test_twoNumberSum_fiundNumbersWithTwoForLoops() {
        let sut = TwoNumberSumEngine()
        
        let array = [1, -9, -1, 11, 21]
        let target = 10
        
        let result = sut.findNumbersTwoForLoops(array: array, target: target)
        
        XCTAssertEqual(result, [-1, 11])
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  PalindromeChecker.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 11/11/2024.
//

import XCTest

class PalindromeCheckerEngine {
    func easyChecker(_ string: String) -> Bool {
        let cleaned = string.lowercased().filter { $0.isNumber || $0.isLetter }
        
        return cleaned == String(cleaned.reversed())
    }
    
    
    // MARK: Complexity Analysis: O(n^2) Time - O(n) Space
    func notThatEasyChecker(_ string: String) -> Bool {
        var reversedString = ""
        
        for i in string.indices.reversed() {
            reversedString += String(string[i])
        }
        
        return reversedString == string
    }
}

final class PalindromeChecker: XCTestCase {

    func test_checker() {
        let sut = PalindromeCheckerEngine()
        let panama = "A man, a plan, a canal, Panama!"
        
        XCTAssertTrue(sut.easyChecker(panama))
    }
    
    func test_notThatEasyChecker_SucceedOnPalindrome() {
        let sut = PalindromeCheckerEngine()
        
        XCTAssertTrue(sut.notThatEasyChecker("abcdcba"))
    }
    
    func test_notThatEasyChecker_FailsOnNonPalindrome() {
        let sut = PalindromeCheckerEngine()
        
        XCTAssertFalse(sut.notThatEasyChecker("abcdcxxba"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

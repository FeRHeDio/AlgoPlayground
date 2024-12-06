//
//  CaesarCipherEncryptor.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 05/12/2024.
//

/*
    ** Prompt **
 
    Given a non-empty string of lowercase letters and a non-negative integer representing a key,
    write a function that retursn a new string obtained by shifting every letter in the input string by k positions
    in the alphabet, where k is the key.
 
    Not that letter should "wrap" around the alphabet; in other words, the letter `z` shifted by one returns the
    letter `a`.
    
 */

import XCTest

class CaesarCipher {
    func normalizeKey(_ key: Int) -> Int {
        key % 26
    }
}

final class CaesarCipherEncryptor: XCTestCase {
    func test_caesarCipher_normalizeKey() {
        let sut = CaesarCipher()
        
        XCTAssertEqual(sut.normalizeKey(28), 2, "Failed to normalize key, 2 expected but received")
        XCTAssertEqual(sut.normalizeKey(52), 0, "Failed to handle full rotations")
    }
}

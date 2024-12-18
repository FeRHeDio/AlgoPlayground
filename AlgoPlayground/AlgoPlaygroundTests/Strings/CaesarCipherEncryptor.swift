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
    
    func shiftLetter(_ letter: Character, _ key: Int, _ alphabet: [Character]) -> Character? {
        guard let letterIndex = alphabet.firstIndex(of: letter) else { return nil }
        
        let newLetterCode = (letterIndex + key) % 26
        return alphabet[newLetterCode]
    }
    
    func encrypt(_ string: String, _ key: Int) -> String {
        let normalizedKey = normalizeKey(key)
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        
        return String(string.compactMap { shiftLetter($0, normalizedKey, alphabet) })
    }
}

final class CaesarCipherEncryptor: XCTestCase {
    func test_caesarCipher_normalizeKey() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.normalizeKey(28), 2, "Failed to normalize key, 2 expected but received")
        XCTAssertEqual(sut.normalizeKey(52), 0, "Failed to handle full rotations")
    }
    
    func test_caesarCipher_shiftLetter() {
        let sut = makeSUT()
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        
        XCTAssertEqual(sut.shiftLetter("a", 2, alphabet), "c", "Failed to shift letter")
        XCTAssertEqual(sut.shiftLetter("x", 2, alphabet), "z", "Failed to shift letter")
        XCTAssertEqual(sut.shiftLetter("z", 2, alphabet), "b", "Failed to shift letter")
        XCTAssertNil(sut.shiftLetter("1", 2, alphabet), "failed to return nil")
    }
    
    func test_caesarCipher_returnsBasicString() {
        let sut = makeSUT()
        let receivedResult = sut.encrypt("abc", 2)
        let expectedResult = "cde"
        
        XCTAssertEqual(
            receivedResult,
            expectedResult,
            "failed to encrypt basic string, expected result: \(expectedResult), but received:\(receivedResult) instead"
        )
    }
    
    func test_caesarCipher_returnsWrappedAround() {
        let sut = makeSUT()
        let receivedResult = sut.encrypt("xyz", 2)
        let expectedResult = "zab"
        
        XCTAssertEqual(
            receivedResult,
            expectedResult,
            "failed to wrap around, expected result: \(expectedResult) received: \(receivedResult) instead"
        )
    }
    
    func test_caesarCipher_handleLargeKey() {
        let sut = makeSUT()
        let receivedResult = sut.encrypt("abc", 28)
        let expectedResult = "cde"
        
        XCTAssertEqual(
            expectedResult,
            expectedResult,
            "failed to handle large key, expected result: \(expectedResult), but received: \(receivedResult) instead"
        )
    }
    
    func test_caesarCipher_handlesLargeString() {
        let sut = makeSUT()
        let receivedResult = sut.encrypt("mvklahvjcnbwqvtutmfafkwiuagjkzmzwgf", 7)
        let expectedResult = "tcrshocqjuidxcabatmhmrdpbhnqrgtgdnm"
        
        XCTAssertEqual(
            receivedResult,
            expectedResult,
            "Failed to handle large input, expected \(expectedResult), received  : \(receivedResult) instead"
        )
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> CaesarCipher {
        CaesarCipher()
    }
}

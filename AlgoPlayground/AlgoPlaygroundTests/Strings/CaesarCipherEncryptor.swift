//
//  CaesarCipherEncryptor.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 05/12/2024.
//

import XCTest

class CaesarCipher {
    func encrypt() -> Bool {
        true
    }
}

final class CaesarCipherEncryptor: XCTestCase {
    func test_caesarCipher_returnsTrue() {
        let sut = CaesarCipher()
        
        XCTAssertEqual(sut.encrypt(), true)
    }
}

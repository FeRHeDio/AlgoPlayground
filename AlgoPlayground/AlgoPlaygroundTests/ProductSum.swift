//
//  ProductSum.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 28/11/2024.
//

/*
    ** Prompt **
 
    Write a function that takes in a `special` array and returns its product sum.
    
    A `special` array is a non-empty array that contains either integer or other `special` arrays.
    
    The `Product Sum` of a `special` array is the sum of its elements, where `special` array inside it are
    summed themselves and then multiplied by their level of depth.
 
    The depth of a `special` array is how far nested it is.
 
    For instance the depth of [] is 1, the depth of the inner array in [[]] is 2, the depth of the inner most
    array in [[[]]] is 3.
 
    Therefore, the product sum of [x, y] is `x + y`, the prodcut sum of [x, [y, z]] is `x + 2 * (y + z)`;
    the product sum of [x, [y, [z]]] is `x + 2 * (y + 3z)`.
 
 */


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

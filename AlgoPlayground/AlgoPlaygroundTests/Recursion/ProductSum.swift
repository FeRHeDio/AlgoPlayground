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
    
    // MARK: - O(n) Time - O(d) Space where d is the depth of the special array or how many nested array it contains.
    
    func productSum(_ array: [Any], multiplier: Int = 1) -> Int {
        var result = 0
        
        array.forEach { element in
            if let nestedArray = element as? [Any] {
                result += productSum(nestedArray, multiplier: multiplier + 1)
            } else if let number = element as? Int {
                result += number
            }
        }
        
        return result * multiplier
    }
}

final class ProductSum: XCTestCase {
    func test_productSumEngine_returnsTrue() {
        let sut = makeSUT()
        
        let array: [Any] = [5, 2, [7, -1], 3, [6, [-13, 8], 4]]
        
        let result = sut.productSum(array)
        
        XCTAssertEqual(result, 12)
    }
    
    
    func test_productSumEngine_returns600() {
        let sut = makeSUT()
        
        let array: [Any] = [[[[[ 5 ]]]]] // 5 x5 -> x4 -> x3 -> x2 -> x1
        
        let result = sut.productSum(array)
        
        XCTAssertEqual(result, 600)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> ProductSumEngine {
        ProductSumEngine()
    }
}

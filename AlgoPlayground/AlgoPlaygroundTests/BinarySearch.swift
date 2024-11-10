//
//  BinarySearch.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 09/11/2024.
//

/*
    Prompt:
 
    Write a function that takes in a sorted array of integers as well as a target integer.
    The function should use the Binary Search algorithm to determine if the target integer is contained in the array.
    Should return the index of the value if exists in the array.
    Otherwise return -1
 
 */

/*
    Solution:
    
    We can split the array in half and see if the target number belong to either part
    We continue to do this until find the number or not
 
    First apporach:
 
    We can implement 3 pointers.
    One for the left side of the split (lidx) other for the right (ridx) and a third for the middle index of the array (midx).
 
    If we compare lidx to ridx we can say something like:
    
    --
    
    WHILE lidx is less or equal than ridx
    midx is going to be equal to lidx plus ridx divided by 2 (rounded) -> this is our middle point.
    
    if midx contains the target in the array we're done
    assign midx to the result and return
    
    if midx contains a larger number than the target
        our target it's at the right side of our split, then
        lidx becomes equal to midx + 1 (because midx was already compared)
 
    if midx contains a smaller number than the target
        our target it's at the left side of our split, then
        ridx becomes equal to midx - 1
 
    --
 
    now while fires again until we find the number or the result keeps as -1.
    
 */

import XCTest

class BinarySearchEngine {
    func search(for targetNumber: Int, in array: [Int]) -> Int {
        var lidx = 0
        var ridx = array.count - 1
        var midx: Int = 0
        var result = -1
        
        while lidx <= ridx {
            midx = (lidx + ridx) / 2
            
            if array[midx] == targetNumber {
                result = midx
                return result
            } else if array[midx] < targetNumber {
                lidx = midx + 1
            } else {
                ridx = midx - 1
            }
        }
        
        return result
    }
}

final class BinarySearch: XCTestCase {
    func test_searchForNumber1_returnsNumberOne() {
        let sut = BinarySearchEngine()
        let targetNumber = 18
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.search(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(searchArray.firstIndex(of: targetNumber), result)
    }

    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

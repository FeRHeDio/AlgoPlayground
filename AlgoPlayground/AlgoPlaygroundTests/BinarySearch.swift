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
 
    ** Iterative Apporach **
 
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
 
    now while fires again until we find the number or the result keeps as -1.
    --
 
    ** Recursive approach **
 
    The main difference is not using a while creating a helper who is recalled.
    The space complexity is O(Log(n)) due to the fact that each recursive call is added to the call stack using more memory.
    
 */

import XCTest

class BinarySearchEngine {
    
    // MARK: Complexity Analysis
    // O(Log(n)) Time
    // O(1) Space
    
    func iterativeBinarySearch(for targetNumber: Int, in array: [Int]) -> Int {
        var lidx = 0
        var ridx = array.count - 1
        var midx: Int = 0
        
        while lidx <= ridx {
            midx = (lidx + ridx) / 2
            
            if array[midx] == targetNumber {
                return midx
            } else if array[midx] < targetNumber {
                lidx = midx + 1
            } else {
                ridx = midx - 1
            }
        }
        
        return -1
    }
    
    // MARK: Complexity Analysis
    // O(Log(n)) Time
    // O(Log(n)) Space
    
    func recursiveBinarySearch(for targetNumber: Int, in array: [Int]) -> Int {
        recursiveHelper(array: array, target: targetNumber, lidx: 0, ridx: array.count - 1)
    }
    
    // MARK: Helpers
    
    func recursiveHelper(array: [Int], target: Int, lidx: Int, ridx: Int) -> Int {
        if lidx > ridx { return -1 }
        
        let midx = (lidx + ridx) / 2
        
        if array[midx] == target {
            return midx
        } else if target < array[midx] {
            return recursiveHelper(array: array, target: target, lidx: lidx, ridx: midx - 1)
        } else {
            return recursiveHelper(array: array, target: target, lidx: midx + 1, ridx: ridx)
        }
    }
    
}

final class BinarySearch: XCTestCase {
    func test_searchForNumber1_returnsIDX0() {
        let sut = makeSUT()
        let targetNumber = 1
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.iterativeBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(searchArray.firstIndex(of: targetNumber), result)
    }

    func test_searchForNumber18_returnsIDX6() {
        let sut = makeSUT()
        let targetNumber = 18
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.iterativeBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(searchArray.firstIndex(of: targetNumber), result)
    }
    
    func test_searchForNumber53_returnsIDX8() {
        let sut = makeSUT()
        let targetNumber = 53
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.iterativeBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(searchArray.firstIndex(of: targetNumber), result)
    }
    
    func test_searchForNumber54_returnsMinusOne() {
        let sut = makeSUT()
        let targetNumber = 54
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.iterativeBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(-1, result)
    }
    
    func test_searchForNumber0_returnsMinusOne() {
        let sut = makeSUT()
        let targetNumber = 0
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.iterativeBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(-1, result)
    }
    
    // MARK: Recursive Binary Search
    
    func test_recuersiveSearchForNumber1_returnsIDX0() {
        let sut = makeSUT()
        let targetNumber = 1
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.recursiveBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(searchArray.firstIndex(of: targetNumber), result)
    }

    func test_recuersiveSearchForNumber18_returnsIDX6() {
        let sut = makeSUT()
        let targetNumber = 18
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.recursiveBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(searchArray.firstIndex(of: targetNumber), result)
    }
    
    func test_recuersiveSearchForNumber53_returnsIDX8() {
        let sut = makeSUT()
        let targetNumber = 53
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.recursiveBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(searchArray.firstIndex(of: targetNumber), result)
    }
    
    func test_recuersiveSearchForNumber54_returnsMinusOne() {
        let sut = makeSUT()
        let targetNumber = 54
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.recursiveBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(-1, result)
    }
    
    func test_recuersiveSearchForNumber0_returnsMinusOne() {
        let sut = makeSUT()
        let targetNumber = 0
        let searchArray = [1, 3, 4, 8, 13, 18, 22, 44, 53]
    
        let result = sut.recursiveBinarySearch(for: targetNumber, in: searchArray)
        
        XCTAssertEqual(-1, result)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> BinarySearchEngine {
        BinarySearchEngine()
    }
    
    func testIterativeBinarySearch() throws {
        self.measure(metrics: [XCTClockMetric()]) {
            test_searchForNumber1_returnsIDX0()
            test_searchForNumber18_returnsIDX6()
            test_searchForNumber53_returnsIDX8()
            test_searchForNumber0_returnsMinusOne()
            test_searchForNumber54_returnsMinusOne()
        }
    }
    
    func testRecursiveBinarySearch() throws {
        self.measure(metrics: [XCTClockMetric()]) {
            test_recuersiveSearchForNumber1_returnsIDX0()
            test_recuersiveSearchForNumber18_returnsIDX6()
            test_recuersiveSearchForNumber53_returnsIDX8()
            test_recuersiveSearchForNumber0_returnsMinusOne()
            test_recuersiveSearchForNumber54_returnsMinusOne()
        }
    }
}

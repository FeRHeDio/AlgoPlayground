//
//  MinimumWaitingTime.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 26/11/2024.
//

/*
    ** Prompt **
 
    You're given a non-empty array of positive integers representing the amounts of time that specific queries take to execute.
    Only on query can be executed at a time, but the queries can be executed in any order.
 
    A query's `waiting time`is defined as the amount of time that it must wait before its execution starts. In other words,
    if a query is executed second, then its waiting time is the duration of the first query; if a query is executed third,
    then its waiting time is the sum of the durations of the first two queries.
 
    Write a function that returns the minimum amount of total waiting time for all of the queries.
    
    For example, if your're given the queries of durations [1, 4, 5], then the total waiting time if the queries were
    executed in the order [5, 1, 4] would be (0) + (5) + (5+1) = 11.

    The first query of duration 5 would be executed immediately, so its waiting time would be 0, the second query of duration 1
    would have to wait 5 seconds (the duration of the first query) to be exectuted, and the last query would have to wait the
    duration of the first two queries before being executed.
 
    You can mutate the input array.
 */

import XCTest

class WaitingTimeEngine {
    func calculateMinimumTime(of array: inout [Int]) -> Int {
        var result = 0
        
        array.sort(by: <)
        
        array.enumerated().forEach { idx, duration in
            let queriesLeft = array.count - (idx + 1)
            
            result += duration * queriesLeft
        }
        
        return result
    }
}

final class MinimumWaitingTime: XCTestCase {
    func test_waitingTime_firstTest() {
        let sut = makeSUT()
        
        var input = [3, 2, 1, 2, 6]
        
        let result = sut.calculateMinimumTime(of: &input)
        
        XCTAssertEqual(result, 17)
    }
    
    func test_waitingTime_secondTest() {
        let sut = makeSUT()
        
        var input =  [17, 4, 3]
        
        let result = sut.calculateMinimumTime(of: &input)
        
        XCTAssertEqual(result, 10)
    }
    
    func test_waitingTime_thirdTest() {
        let sut = makeSUT()
        
        var input = [1, 1, 1, 4, 5, 6, 8, 1, 1, 2, 1]
        
        let result = sut.calculateMinimumTime(of: &input)
        
        XCTAssertEqual(result, 81)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> WaitingTimeEngine {
        WaitingTimeEngine()
    }
}

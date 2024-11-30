//
//  TandemBicycle.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 30/11/2024.
//

/*
    ** Prompt **
 
    A Tandem Bicycle is a bicycle that's operated by two people: Person A and Person B.
    Both people pedal the bicycle, but the person that pedal faster dictates the speed of the bicycle.
    
    So if a person A pedals at a speed of 5, and a person B pedals at a speed of 4, the tandem will move at a speed of 5.
    `speed = max(speedA, speedB)
 
    You're given two lists of positive integers: One that contains the speed of riders wearing red shirts and
    one that contains the speeds of riders wearing blue shirts. Each riders is represented by a single positive integer,
    which is the speed that they pedal a tandem bicycle at. Both lists have the same length, meaning that they are as
    many red-shirt riders as blue-shirt riders. Your goal is to pair every rider wearing a blue shirt with the other
    with a red shirt to operate a tandem.
 
    Write a function that returns the maximum possible total speed or the minimum possible total speed of all
    of the tandem bicycles being ridden based on an inmput parameter, `fastest`, if `fastest = true`, your function
    should return the maximum possible total speed; otherwise it should return the minimum total speed.
 
    `Total speed` is defined as the sums of the speeds of all the tandem bicycles being ridden. For example, if there
    are four riders (2 blue-shirts and 2 red-shirts) who have speeds 1,3,4,5, and if they're paired on tandem bicycles
    as follows: [1, 4], [5, 3], then the total speed of these tandem bicycles is `4 + 5 = 9`.
 
 
 */

import XCTest

class TandemBicycleEngine {
    func calculate() -> Bool {
        true
    }
}

final class TandemBicycle: XCTestCase {
    func test_tandemBicycle_returns() {
        let sut = TandemBicycleEngine()
        
        XCTAssertEqual(sut.calculate(), true)
    }
}

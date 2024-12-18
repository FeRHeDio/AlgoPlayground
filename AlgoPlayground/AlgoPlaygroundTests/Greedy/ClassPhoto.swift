//
//  ClassPhoto.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 24/11/2024.
//

/*
    ** Prompt **
 
    It's photo day at the school, and you're the photographer assigned to take the photos.
    The class that you'll be photographing has an even number of students, and all this 
    students are wearing red or blue shirts.
    In fact, half of the class is wearing red shirts, and the other half is wearing blue shirts.
    You're responsible for arranging t<he
    students in two rows before taking the photo. Each row should contain the same number of 
    students and should adhere to the following
    guidelines.
 
    - All Students wearing red shirts must be in the same row.
    - All Students wearing blue shirts must be in the same row.
    - Each Student in the back must be strictly taller than the Student directly in fron of them in the fron row.
 
    You're given two input arrays: One containing the heights of all students with red shirts and another 
    one containing all the students
    with blue shirts. Thus array would be the same length. All heights will be positive integers. 
    Assume that each class has at least 2 Students.
 
    Return wheter or not the class photo following this guideines can be taken.
 
 */
import XCTest

class ClassPhotoEngine {
    func classPhoto(redShirts: inout [Int], blueShirts: inout [Int]) -> Bool {
        redShirts.sort(by: >)
        blueShirts.sort(by: >)
        
        let shirtInFront = redShirts[0] > blueShirts[0] ? "BLUE" : "RED"
        
        for idx in blueShirts.indices {
            let blueShirt = blueShirts[idx]
            let redShirt = redShirts[idx]
            
            if (shirtInFront == "RED" && redShirt >= blueShirt) || (shirtInFront == "BLUE" && blueShirt >= redShirt) {
                return false
            }
        }
        return true
    }
}

final class ClassPhoto: XCTestCase {
    func test_classPhoto_returnsTrue() {
        let sut = makeSUT()
        var redShirts = [4, 2, 3, 8]
        var blueShirts = [5, 3, 4, 9]
        
        let result = sut.classPhoto(redShirts: &blueShirts, blueShirts: &redShirts)
        
        XCTAssertEqual(result, true)
    }
    
    func test_classPhoto_returnsFalse() {
        let sut = makeSUT()
        var redShirts = [4, 4, 3, 8] // the last number is greater than the latest number in the prior defined back row.
        var blueShirts = [5, 3, 4, 9]
        
        let result = sut.classPhoto(redShirts: &blueShirts, blueShirts: &redShirts)
        
        XCTAssertEqual(result, false)
    }
    
    func test_classPhoto_returnsTrue1() {
        let sut = makeSUT()
        var redShirts = [3, 5, 6, 8, 2]
        var blueShirts = [2, 4, 7, 5, 1]
        
        let result = sut.classPhoto(redShirts: &blueShirts, blueShirts: &redShirts)
        
        XCTAssertEqual(result, true)
    }
    
    func test_classPhoto_returnsFalse1() {
        let sut = makeSUT()
        var redShirts = [19, 19, 21, 1, 1, 1, 1, 1]
        var blueShirts = [20, 5, 4, 4, 4, 4, 4, 4]
        
        let result = sut.classPhoto(redShirts: &blueShirts, blueShirts: &redShirts)
        
        XCTAssertEqual(result, false)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> ClassPhotoEngine {
        ClassPhotoEngine()
    }
}

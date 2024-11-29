//
//  OptimalFreelancing.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 28/11/2024.
//

/*
    ** Prompt **
 
    You recently started freelance software development and have been offered a variety of job opportunities.
    Each job has a deadline, meaning there is no value in completing the work after the deadline.
    Additionaly each job has an associated payment representing the profit for completing that job.
 
    Given this information, write a function that returns the maximum profit that can be obtained in a 7 day period.
 
    Each job will take a full day to complete, and the deadline will be given as the numbers of days left to complete the job.
 
    For example, if a job has a deadline of 1, then it can only be completed if it is the first job worked on.
    If a job has a deadline of 2, then it could be started on the first or second day.
 
    Note: There is no requirement to complete all of the jobs. Only one job can be worked on at a time, meaning that in some
    scenarios it will be impossible to complete them all.
    
 */

import XCTest

class OptimalFreelancingEngine {
    func calculateOptimal(_ jobs: [[String: Int]]) -> Int {
        var profit = 0
        let lengthOfWeek = 7
        var timeline = Array(repeating: false, count: lengthOfWeek)
        
        // Sort in descending order
        let sortedJobs = jobs.sorted { $0["payment"]! > $1["payment"]! }
        
        for job in sortedJobs {
            guard let deadline = job["deadline"], let payment = job["payment"] else { continue }
            
            let maxTime = min(deadline, lengthOfWeek)
            
            // For each job, the latest available day (within its deadline) is checked using a reverse loop (stride).
            for time in stride(from: maxTime - 1, through: 0, by: -1) {
                
                // If a day is available (false), it is marked as booked (true), and the payment is added to the profit.
                if !timeline[time] {
                    timeline[time] = true
                    profit += payment
                    
                    break
                }
            }
        }
        
        return profit
    }
}


final class OptimalFreelancing: XCTestCase {
    func test_optimalFreelancing_returns5() {
        let sut = makeSUT()
        
        let jobs = [
            ["deadline": 8, "payment": 3],
            ["deadline": 1, "payment": 1],
            ["deadline": 1, "payment": 2],
        ]
        
        let result = sut.calculateOptimal(jobs)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_optimalFreelancing_returns142() {
        let sut = makeSUT()
        
        let jobs = [
            ["deadline": 2, "payment": 100],
            ["deadline": 1, "payment": 19],
            ["deadline": 2, "payment": 27],
            ["deadline": 1, "payment": 25],
            ["deadline": 3, "payment": 15]
        ]
        
        let result = sut.calculateOptimal(jobs)
        
        XCTAssertEqual(result, 142)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> OptimalFreelancingEngine {
        OptimalFreelancingEngine()
    }
}

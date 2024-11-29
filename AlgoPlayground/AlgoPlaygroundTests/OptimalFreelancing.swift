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
    func calculateOptimal(_ jobs: inout [[String: Int]]) -> Int {
        var result = 0
        
        jobs = jobs.sorted { (job1, job2) in
            (job1["payment"] ?? 0) < (job2["payment"] ?? 0)
        }
        
        for job in jobs {
            // incomplete stuff
        }
        
        return result
    }
}


final class OptimalFreelancing: XCTestCase {
    func test_optimalFreelancing_returnsTrue() {
        let sut = OptimalFreelancingEngine()
        
        var jobs = [
            [
                "deadline": 8,
                "payment": 3
            ],
            [
                "deadline": 1,
                "payment": 1
            ],
            [
                "deadline": 1,
                "payment": 2
            ],
        ]
        
        let result = sut.calculateOptimal(&jobs)
        
        XCTAssertEqual(result, 0)
    }
}

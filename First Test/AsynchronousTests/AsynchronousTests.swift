//
//  AsynchronousTests.swift
//  AsynchronousTests
//
//  Created by Jesse Ruiz on 9/15/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import XCTest
@testable import First_Test

class AsynchronousTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func DISABLED_testPtimesUpTo100ShouldBe25() {
        // Given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        
        // When
        PrimeCalculator.calculate(upTo: maximumCount) {
            // Then
            XCTAssertEqual($0.count, 25)
            // That sets a maximum value of 100, then asks the prime
            // calculator to figure out all the primes up to that number.
            // Finally, it asserts that zero primes were found.
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testPrimesUpTo100ShouldBe25() {
        // Given
        let maxCount = 100
        
        // When
        let progress = PrimeCalculator.calculate(upTo: maxCount) {
            XCTAssertEqual($0.count, 25)
        }
        
        // Then
        let predicate = NSPredicate(format: "%@.completedUnitCount == %@", argumentArray: [progress, maxCount])
        
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
        wait(for: [expectation], timeout: 10)
    }
}

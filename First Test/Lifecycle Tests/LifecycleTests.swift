//
//  LifecycleTests.swift
//  First TestTests
//
//  Created by Jesse Ruiz on 9/14/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import XCTest

class LifecycleTests: XCTestCase {
    
    class LifecycleTests: XCTestCase {
        override class func setUp() {
            print("In class setUp.")
        }
        
        override class func tearDown() {
            print("In class teardown.")
        }
        
        override func setUp() {
            print("In setUp.")
        }
        
        override func tearDown() {
            print("In tearDown.")
        }
        
        func testExample() {
            print("Starting test.")
            
            addTeardownBlock {
                print("In first tearDown Block.")
            }
            
            print("In middle of test")
            
            addTeardownBlock {
                print("In second tearDown block")
            }
            
            print("Finishing test")
        }
    }

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
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

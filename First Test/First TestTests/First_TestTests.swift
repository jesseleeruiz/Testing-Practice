//
//  First_TestTests.swift
//  First TestTests
//
//  Created by Jesse Ruiz on 9/13/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import XCTest
@testable import First_Test

class First_TestTests: XCTestCase {

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
    
    func testHaterStartsNicely() {
        let hater = Hater()
        
        XCTAssertFalse(hater.hating)
    }
    
    func testHaterHatesAfterBadDay() {
        var hater = Hater()
        
        hater.hadABadDay()
        
        XCTAssertTrue(hater.hating)
    }
    
    func testHaterHappyAfterGoodDay() {
        var hater = Hater()
        
        hater.hadAGoodDay()
        
        XCTAssertFalse(hater.hating)
    }

}

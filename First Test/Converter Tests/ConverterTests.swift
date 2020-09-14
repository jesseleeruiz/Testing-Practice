//
//  ConverterTests.swift
//  First TestTests
//
//  Created by Jesse Ruiz on 9/14/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import XCTest
@testable import First_Test

class ConverterTests: XCTestCase {
    
    // System Under Test
    var sut: Converter!

    override func setUpWithError() throws {
        sut = Converter()
    }

    override func tearDownWithError() throws {
        sut = nil
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
    
    func test32FahrenheitIsZeroCelsius() {
        // Given
        let input1 = 32.0
        
        // When
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        
        // Then
        XCTAssertEqual(output1, 0, accuracy: 0.000001)
    }
    
    func test212FahrenheitIs100Celsius() {
        // Given
        let input2 = 212.0
        
        // When
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        
        // Then
        XCTAssertEqual(output2, 100, accuracy: 0.000001)
    }
}

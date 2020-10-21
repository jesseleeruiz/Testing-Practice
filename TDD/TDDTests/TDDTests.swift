//
//  TDDTests.swift
//  TDDTests
//
//  Created by Jesse Ruiz on 10/21/20.
//

import XCTest
@testable import TDD

class TDDTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadingBookAddsToLibrary() {
        // Given
        let bookToBuy = "Great Expectations"
        var user = User()
        
        // When
        user.buy(bookToBuy)
        
        // Then
        XCTAssertTrue(user.owns(bookToBuy))
    }
    
}

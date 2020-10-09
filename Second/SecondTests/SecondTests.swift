//
//  SecondTests.swift
//  SecondTests
//
//  Created by Jesse Ruiz on 9/22/20.
//

import XCTest
@testable import Second

class SecondTests: XCTestCase {

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

    func DISABLED_test4Bed2BathHouse_Fits3Bed2BathRequirements() {
        // Given
        let house = House(bedrooms: 4, bathrooms: 2)
        let desiredBedrooms = 3
        let desiredBathrooms = 2
        
        // When
        let suitability = house.checkSuitability(desiredBedrooms: desiredBedrooms, desiredBathrooms: desiredBathrooms)
        
        // Then
        XCTAssertTrue(suitability)
    }
    
    func testUserCantBuyUnreleasedApp() {
        struct UnreleasedAppStub: AppProtocol {
            var price: Decimal = 0
            var minimumAge: Int = 0
            var isReleased: Bool = false
            
            func canBePurchased(by user: UserProtocol) -> Bool {
                return false
            }
        }
        
        // Given
        var sut = User(funds: 100, age: 21, apps: [])
        let app = UnreleasedAppStub()
        
        // When
        let wasBought = sut.buy(app)
        type(of: app).printTerms()
        
        // Then
        XCTAssertFalse(wasBought)
    }
    
    func testViewingHouseAddsOneToViewings() {
        // Given
        let buyer = Buyer()
        let house = HouseMock()
        
        // When
        buyer.view(house)
        
        // Then
        XCTAssertEqual(house.numberOfViewings, 1)
    }
}

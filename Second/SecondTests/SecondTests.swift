//
//  SecondTests.swift
//  SecondTests
//
//  Created by Jesse Ruiz on 9/22/20.
//

import XCTest
@testable import Second

class SecondTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

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
    
    func DISABLED_testUserCantBuyUnreleasedApp() {
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
    
    func DISABLED_testViewingHouseAddsOneToViewings() {
        // Given
        let buyer = Buyer()
        let house = HouseMock()
        
        // When
        buyer.view(house)
        
        // Then
        XCTAssertEqual(house.numberOfViewings, 1)
    }
    
    /*
     MOCKING NETWORKING
     
     What do we want to test for?
     
        1. What was the URL that was requested?
        2. Was a network request actually started?
        3. Did the request come back with certain data?
        4. Did the request come back with a specific error?
     */
    
    // Create mock version of dataTask with empty resume()
    class DataTaskMock: URLSessionDataTask {
        override func resume() { }
    }
}

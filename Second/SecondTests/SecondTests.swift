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
        var completionHandler: (Data?, URLResponse?, Error?) -> Void
        var resumeWasCalled = false
        
        // Stash away the completion handler so we can call it later
        
        init(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
            self.completionHandler = completionHandler
        }
        
        override func resume() {
                // Resume was called, so flip our boolean & call the completion
                resumeWasCalled = true
                completionHandler(nil, nil, nil)
            }
        }
    
    
    class URLSessionMock: URLSessionProtocol {
        var testData: Data?
        
        // URLSessionMock to track last URL.
        // Using defer to auto call completionHandler and set nil values
        // Don't care what comes back; just checking URL being requested correctly.
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            
            defer {
                completionHandler(testData, nil, nil)
            }
            return DataTaskMock()
        }
    }
    
    func testNewsFetchCallsResume() {
        // Given
        let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!
        let news = News(url: url)
        let session = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading news stories triggers resume().")
        
        // When
        news.fetch(using: session) {
            XCTAssertTrue(session.dataTask?.resumeWasCalled ?? false)
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 5)
    }
}

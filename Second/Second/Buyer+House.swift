//
//  Buyer+House.swift
//  Second
//
//  Created by Jesse Ruiz on 10/9/20.
//

import Foundation

protocol HouseProtocol {
    var numberOfViewings: Int { get set }
    func conductViewing()
}

class Buyer {
    func view(_ house: HouseProtocol) {
        house.conductViewing()
    }
}

class AHouse: HouseProtocol {
    var numberOfViewings = 0
    
    func conductViewing() {
        numberOfViewings += 1
    }
}

class HouseMock: HouseProtocol {
    var numberOfViewings: Int = 0
    
    func conductViewing() {
        numberOfViewings += 1
    }
}

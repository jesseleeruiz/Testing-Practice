//
//  App.swift
//  Second
//
//  Created by Jesse Ruiz on 9/22/20.
//

import Foundation

protocol AppProtocol {
    var price: Decimal { get set }
    var minimumAge: Int { get set }
    var isReleased: Bool { get set }
    
    func canBePurchased(by user: UserProtocol) -> Bool
    static func printTerms()
}

struct App: AppProtocol {
    var price: Decimal
    var minimumAge: Int
    var isReleased: Bool
    
    func canBePurchased(by user: UserProtocol) -> Bool {
        guard isReleased else {
            return false
        }
        
        guard user.funds >= price else {
            return false
        }
        
        if user.age >= minimumAge {
            return true
        } else {
            return false
        }
    }
}

extension AppProtocol {
    static func printTerms() {
        print("Here are 50 pages of terms and conditions for you to read on a tiny phone screen.")
    }
}

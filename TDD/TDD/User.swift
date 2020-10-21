//
//  User.swift
//  TDD
//
//  Created by Jesse Ruiz on 10/21/20.
//

import Foundation

struct User {
    var products = Set<String>()
    
    mutating func buy(_ product: String) {
        products.insert(product)
    }
    
    func owns(_ product: String) -> Bool {
        return products.contains(product)
    }
}

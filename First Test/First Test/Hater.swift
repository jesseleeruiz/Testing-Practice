//
//  Hater.swift
//  First Test
//
//  Created by Jesse Ruiz on 9/13/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

struct Hater {
    
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
        
    mutating func hadAGoodDay() {
        hating = false
    }
}

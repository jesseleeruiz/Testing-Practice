//
//  Converter.swift
//  First Test
//
//  Created by Jesse Ruiz on 9/14/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

struct Converter {
    func convertToCelcius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5 / 9
    }
}

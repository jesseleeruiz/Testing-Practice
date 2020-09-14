//
//  Converter.swift
//  First Test
//
//  Created by Jesse Ruiz on 9/14/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        
        return celsius.value
    }
}

//
//  Game.swift
//  First Test
//
//  Created by Jesse Ruiz on 9/14/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

enum GameError: LocalizedError {
    case notPurchased
    case notInstalled
    case parentalControlsDisabled
}

struct Game {
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisabled
        } else {
            print("\(name) is OK to play!")
        }
    }
}

extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}

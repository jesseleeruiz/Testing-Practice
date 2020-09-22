//
//  PrimeCalculator.swift
//  First Test
//
//  Created by Jesse Ruiz on 9/15/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

struct PrimeCalculator {
//    static func calculate(upTo max: Int, completion: @escaping ([Int]) -> Void) {
//        // Push our work straight to a background thread
//        DispatchQueue.global().async {
//            guard max > 1 else {
//                // If the input value is 0 or 1 exit immediately
//                return
//            }
//
//            // Mark all our numbers as prime
//            var sieve = [Bool](repeating: true, count: max)
//
//            // 0 & 1 are by definition not prime
//            sieve[0] = false
//            sieve[1] = false
//
//            // Count from 0 up to the ceiling
//            for number in 2..<max {
//                // If this is marked as prime, then every multiple of it is not prime
//                if sieve[number] == true {
//                    for multiple in stride(from: number * number, to: sieve.count, by: number) {
//                        sieve[multiple] = false
//                    }
//                }
//            }
//            // Collapse our results down to a single array of primes
//            let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
//            completion(primes)
//        }
//    }
    
    
    // Test Progress
//    static func calculate(upTo max: Int, completion: @escaping ([Int]) -> Void) -> Progress {
//        // Create a Progress object that counts up to our max number
//        let progress = Progress(totalUnitCount: Int64(max))
//
//        DispatchQueue.global().async {
//            guard max > 1 else {
//                completion([])
//                return
//            }
//
//            var sieve = [Bool](repeating: true, count: max)
//            sieve[0] = false
//            sieve[1] = false
//
//            // Add 2 to our progress counter, because we already went through 0 && 1
//            progress.completedUnitCount += 2
//
//            for number in 2 ..< max {
//                // Every time we've checked one number, add 1 to our completed unit count
//                progress.completedUnitCount += 1
//
//                if sieve[number] == true {
//                    for multiple in stride(from: number * number, to: sieve.count, by: number) {
//                        sieve[multiple] = false
//                    }
//                }
//            }
//            let primes = sieve.enumerated().compactMap {
//                $1 == true ? $0 : nil
//            }
//            completion(primes)
//        }
//        // Send back the Progress object
//        return progress
//    }
    
    // Synchronous Test Function
    static func calculate(upTo max: Int) -> [Int] {
        guard max > 1 else {
            return []
        }
        
        var sieve = [Bool](repeating: true, count: max)
        sieve[0] = false
        sieve[1] = false
        
        for number in 2 ..< max {
            if sieve[number] == true {
                for multiple in stride(from: number * number, to: sieve.count, by: number) {
                    sieve[multiple] = false
                }
            }
        }
        let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
        return primes
    }
}

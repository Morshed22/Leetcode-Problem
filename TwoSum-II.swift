//
//  TwoSum.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 9/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation

func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
    var lowest = 0
    var highest = numbers.count - 1
    
        while (lowest < highest) {
            let sum = numbers[lowest] + numbers[highest]
            
            if sum == target{
                lowest += 1
                highest += 1
                return [lowest, highest]
            }
            else if sum < target {
                lowest += 1
            }
            else {
                highest -= 1
            }
        }

        return [-1, -1]
}


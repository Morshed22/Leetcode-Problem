//
//  MatchsticksSquare.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 10/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/matchsticks-to-square/

func matchSticksSquare(nums:[Int])->Bool{
    
    if nums.count == 0 && nums.count < 4 {
        return false
    }
    let sum = nums.reduce(0, +)
    
    if sum%4 != 0 {
        return false
    }
    let largest = sum/4
    
    return isSquarable(nums: nums.sorted(by: > ), sums: Array(repeating: 0, count: 4), index: 0, target: largest)
    
    
}
func isSquarable(nums: [Int], sums: [Int], index: Int, target: Int)->Bool{
    if index == nums.count {
        guard sums[0]==target, sums[1]==target, sums[2]==target, sums[3]==target else {
            return false
        }
        return true
    }
    for i in 0..<4 {
        if sums[i] + nums[index] <= target {
            var ss = sums
            ss[i] += nums[index]
            if isSquarable(nums: nums, sums: ss, index: index+1, target: target) {
                return true
            }
        }
    }
    return false
}

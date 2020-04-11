//
//  665-NonDevreasingArray.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 11/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/non-decreasing-array/

func checkPossibility(_  nums: [Int]) -> Bool {
    var nums =  nums
    var changeDone = false
    
    for i in 0..<nums.count-1{
        
        if nums[i] <= nums[i+1]{
            continue
        }
        if changeDone {
            return false
        }
        changeDone = true
        
        let prev = i==0 ? i+1 : i-1
        let next = i+1
        
        if nums[prev] <= nums[next]{
            nums[i] = nums[prev]
        }else{
            nums[next] = nums[i]
        }
    }
    return true
}

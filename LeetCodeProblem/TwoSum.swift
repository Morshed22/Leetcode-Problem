//
//  TwoSum.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 8/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var dic = [Int:Int]()
       for (i, v) in nums.enumerated(){
           let remaining = target-v
           if dic.keys.contains(remaining){
               return [dic[remaining]!,i]
           }
           dic[v] = i
       }
       return []
}
   


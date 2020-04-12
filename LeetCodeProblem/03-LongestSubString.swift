//
//  03-LongestSubString.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 11/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation

extension String {
  func getCharAtIndex(_ index: Int) -> Character {
      return self[self.index(self.startIndex, offsetBy: index)]
    }
}
 // this approach failed long String case
//func lengthOfLongestSubstring(_ s: String) -> Int {
//    if s.count < 2{
//        return s.count
//    }
//    var left = 0
//    var right = 0
//    var maxValue = 0
//    var map = [Character:Character]()
//    while right < s.count {
//        let char = s.getCharAtIndex(right)
//        if map[char] == nil{
//            map[char] = char
//            right += 1
//            maxValue = max (maxValue, right-left)
//        }else{
//        let char = s.getCharAtIndex(left)
//        map[char] = nil
//        left += 1
//        }
//    }
//    return maxValue
//}


func lengthOfLongestSubstring(_ s: String) -> Int {
    var cache = Array(repeating:-1, count: 256)
    var start = 0
    var maxValue = 0
    var i = 0
    while i < s.count {
        let char = Int(s.getCharAtIndex(i).asciiValue!)
        start = max(cache[char]+1, start)
        maxValue = max(maxValue, i-start+1)
        cache[char] = i
        i += 1
    }
    return maxValue
}

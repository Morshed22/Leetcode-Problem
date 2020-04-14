//
//  05-LongestPalindrome.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 14/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation
public extension String {
    subscript (i: Int) -> Element {
    return self[index(startIndex, offsetBy: i)]
    }
 
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy:max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }
}

//time limit excceed for long staring but in Java its working fine.
// comapre to Java swift took to much time Specially in string problem

//jrjnbctoqgzimtoklkxcknwmhiztomaofwwzjnhrijwkgmwwuazcowskjhitejnvtblqyepxispasrgvgzqlvrmvhxusiqqzzibcyhpnruhrgbzsmlsuacwptmzxuewnjzmwxbdzqyvsjzxiecsnkdibudtvthzlizralpaowsbakzconeuwwpsqynaxqmgngzpovauxsqgypinywwtmekzhhlzaeatbzryreuttgwfqmmpeywtvpssznkwhzuqewuqtfuflttjcxrhwexvtxjihunpywerkktbvlsyomkxuwrqqmbmzjbfytdddnkasmdyukawrzrnhdmaefzltddipcrhuchvdcoegamlfifzistnplqabtazunlelslicrkuuhosoyduhootlwsbtxautewkvnvlbtixkmxhngidxecehslqjpcdrtlqswmyghmwlttjecvbueswsixoxmymcepbmuwtzanmvujmalyghzkvtoxynyusbpzpolaplsgrunpfgdbbtvtkahqmmlbxzcfznvhxsiytlsxmmtqiudyjlnbkzvtbqdsknsrknsykqzucevgmmcoanilsyyklpbxqosoquolvytefhvozwtwcrmbnyijbammlzrgalrymyfpysbqpjwzirsfknnyseiujadovngogvptphuyzkrwgjqwdhtvgxnmxuheofplizpxijfytfabx

func longestPalindrome(_ s: String) -> String {
    
    let size = s.count
    var containerTable = Array(repeating: Array(repeating: 0, count: size), count: size)
    var maxLength = 1
    
    for index in stride(from: 0, to: size, by: 1){
       containerTable[index][index] = 1
    }
    var start = 0
    for index in stride(from: 0, to: size-1, by: 1){
        if s[index] == s[index+1]{
            containerTable[index][index+1] = 1
            start = index
            maxLength = 2
        }
       }
    
    // now item range with 3, 4, 5, 6... will compare
    var range = 3
    while range <= size {
        for indexI in stride(from: 0, to:size-range+1 , by: 1){
            let indexJ = indexI + range - 1
            if s[indexI] == s[indexJ] && containerTable[indexI+1][indexJ-1] == 1{
                containerTable[indexI][indexJ] = 1
                if range > maxLength{
                    start = indexI
                    maxLength = range
                }
            }
        }
        range += 1
    }
    return s[start..<start+maxLength]
}

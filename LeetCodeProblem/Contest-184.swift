//
//  Contest-184.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 12/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation
//https://leetcode.com/contest/weekly-contest-184


//https://leetcode.com/contest/weekly-contest-184/problems/html-entity-parser/
func entityParser(_ text: String) -> String {
    var str = text
    str = str.replacingOccurrences(of: "&quot;", with: "\"")
    str = str.replacingOccurrences(of: "&apos;", with: "'")
    str = str.replacingOccurrences(of: "&amp;", with: "&")
    str = str.replacingOccurrences(of: "&gt;", with: ">")
    str = str.replacingOccurrences(of: "&lt;", with: "<")
    str = str.replacingOccurrences(of:"&frasl;", with:"/")
    return str
}

//https://leetcode.com/contest/weekly-contest-184/problems/string-matching-in-an-array/

func stringMatching(_ words: [String]) -> [String] {
    var set = Set<String>()
    for (i, str1) in words.enumerated(){
        for (j, str2) in words.enumerated(){
            if i == j {
                continue
            }
            if str1.contains(str2){
                set.insert(str2)
            }
        }
    }
    return Array(set)
}


//this code test fails for 2nd problem

func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
    var arr = [Int]()
    var darr = Array(1...m)
    
    for i in queries{
        print(darr)
        let index = darr.firstIndex(of: i)!
        let v = darr.remove(at: index)
        darr.insert(v, at: 0)
        arr.append(index)
    }
    return arr
}

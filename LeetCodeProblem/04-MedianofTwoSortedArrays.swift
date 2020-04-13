//
//  04-MedianofTwoSortedArrays.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 13/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation

//https://github.com/mission-peace/interview/blob/master/src/com/interview/binarysearch/MedianOfTwoSortedArrayOfDifferentLength.java


//Similar problem in Leetcode
//1053,80,
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
 //if nums1 length is greater than switch them so that nums1 is smaller than nums2.
    
    if nums1.count > nums2.count{
        return findMedianSortedArrays(nums2, nums1)
    }
    let x = nums1.count
    let y = nums2.count
    
    var low = 0
    var high = x
    
    while  low <= high {
        let partitionX = (low+high)/2
        let partitionY = (x+y+1)/2-partitionX
        
        //if partitionX is 0 it means nothing is there on left side. Use -INF for maxLeftX
        //if partitionX is length of nums then there is nothing on right side. Use +INF for minRightX
        let maxLeftX = partitionX == 0 ? Int.min : nums1[partitionX-1]
        let minRightX = partitionX == x ? Int.max : nums1[partitionX]
        
        let maxLeftY = partitionY == 0 ? Int.min : nums2[partitionY-1]
        let minRightY = partitionY == y ? Int.max : nums2[partitionY]
        
        if maxLeftX <= minRightY && maxLeftY <= minRightX{
            //We have partitioned array at correct place
            // Now get max of left elements and min of right elements to get the median in case of even length combined array size
            // or get max of left for odd length combined array size.
            
            if (x+y)%2 == 0{
                return Double(max(maxLeftX,maxLeftY)+min(minRightX, minRightY))/2
            }else{
                return Double(max(maxLeftX, maxLeftY))
            }
        }else if maxLeftX > minRightY{
            high = partitionX-1
        }else{
            low = partitionX+1
        }
    }
    
    return 0.0
}

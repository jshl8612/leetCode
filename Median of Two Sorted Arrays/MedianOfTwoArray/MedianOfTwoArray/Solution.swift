//
//  Solution.swift
//  MedianOfTwoArray
//
//  Created by Shenglong Jiang on 18/07/2019.
//  Copyright © 2019 Shenglong Jiang. All rights reserved.
//

import Foundation

class Solution {
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        let isOdd = count%2 == 1
        let targeIndex = count/2
        var index = 0
        
        var nums1 = nums1
        var nums2 = nums2
        var currentNum: Int
        
        if let first = nums1.first {
            currentNum = first
        } else if let first = nums2.first {
            currentNum = first
        } else {
            return 0
        }
        
        var result: Double = 0
        
        while index <= targeIndex {
            
            guard let n1 = nums1.first else {
                
                if isOdd == false && index == targeIndex {
                    
                    result = Double(nums2.removeFirst() + currentNum)/2
                    
                } else {
                    currentNum = nums2.removeFirst()
                }
                index += 1
                continue
            }
            
            guard let n2 = nums2.first else {
                if isOdd == false && index == targeIndex {
                    
                    result = Double(nums1.removeFirst() + currentNum)/2
                    
                } else {
                    currentNum = nums1.removeFirst()
                }
                index += 1
                continue
            }
            
            if isOdd == false && index == targeIndex {
                
                result = Double(min(n1, n2) + currentNum)/2
                
            } else {
                if n1 < n2 {
                    currentNum = n1
                    nums1.removeFirst()
                } else {
                    currentNum = n2
                    nums2.removeFirst()
                }
            }
            
            index += 1
        }
        
        return isOdd ? Double(currentNum) : result
    }
}

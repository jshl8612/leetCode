//
//  Solution.swift
//  longestSubstring
//
//  Created by Shenglong Jiang on 15/07/2019.
//  Copyright © 2019 Shenglong Jiang. All rights reserved.
//

import Foundation

class Solution {
    static func lengthOfLongestSubstring(_ s: String) -> Int {
    
        var substring: String = ""
        var maxLenght: Int = 0
 
        for char in s {
            if let index = substring.firstIndex(of: char) {
               
                let range = s.startIndex...index
                substring.removeSubrange(range)
            }
            
            substring.append(char)
            maxLenght = max(maxLenght, substring.count)
            
            print(maxLenght)
            print(substring)
        }
        
        return maxLenght
    }
}

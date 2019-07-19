//
//  Solution.swift
//  longestPalindrome
//
//  Created by Shenglong Jiang on 18/07/2019.
//  Copyright © 2019 Shenglong Jiang. All rights reserved.
//

import Foundation

class Solution {
    static func longestPalindrome(_ s: String) -> String {
        
        var s = Array(s)
        var charInfos: [String: [Int]] = [:]
        
        for (index, char) in s.enumerated() {
            if let indexes = charInfos[String(char)] {
                charInfos[String(char)] = indexes + [index]
            } else {
                charInfos[String(char)] = [index]
            }
        }
        
        var result = ""
        
        for (index,char) in s.enumerated() {
            guard s.count - index - 1 > result.count else {
                return result
            }
            
            if let indexes = charInfos[String(char)]?.filter({$0 > index}), indexes.count > 0 {
                
                for endIndex in indexes where result.count < endIndex - index {
                    
                }
            }
        }
        

        return result
    }
    
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        
        var low = 0
        var maxL = 0
        
        let word = Array(s)
        for i in 0..<word.count - 1 {
            checkSubString(i,i,word,&low,&maxL)
            checkSubString(i,i+1,word, &low, &maxL)
        }
        return String(word[low..<low + maxL])
    }
    
    func checkSubString(_ i:Int, _ j:Int, _ s:[Character],_ low:inout Int, _ maxL:inout Int) {
        var x = i
        var y = j
        while (x >= 0 && y < s.count && s[x] == s[y] ) {
            x -= 1
            y += 1
        }
        
        if (maxL < y - x - 1) {
            low = x + 1
            maxL = y - x - 1
        }
    }
}

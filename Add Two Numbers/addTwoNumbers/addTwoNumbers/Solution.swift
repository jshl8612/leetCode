//
//  Solution.swift
//  addTwoNumbers
//
//  Created by Shenglong Jiang on 15/07/2019.
//  Copyright © 2019 Shenglong Jiang. All rights reserved.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode: NSObject {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ vals: [Int]) {
        guard vals.count > 0 else {
            self.val = 0
            return
        }
        self.val = vals[0]
        if vals.count > 1 {
            self.next = ListNode(Array(vals[1...vals.count-1]))
        }
    }
    
    public override var description: String {
        if let next = next {
            return "\(val),\(next)"
        } else {
            return "\(val)"
        }
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var result: ListNode?
        
        result = sum(l1, l2, 0)
        
        return result
    }
    
    private func sum(_ l1: ListNode?, _ l2: ListNode?, _ defaultVal: Int ) -> ListNode? {
        print("l1: \(l1), l2: \(l2), default: \(defaultVal)")
        guard l1 != nil || l2 != nil || defaultVal == 1 else {
            return nil
        }
        
        let sumNode = ListNode(defaultVal)
        sumNode.val += (l1?.val ?? 0) + (l2?.val ?? 0)
        
        if sumNode.val >= 10 {
            sumNode.val -= 10
            
            sumNode.next = sum(l1?.next, l2?.next, 1)
        } else {
            sumNode.next = sum(l1?.next, l2?.next, 0)
        }
        return sumNode
    }
}

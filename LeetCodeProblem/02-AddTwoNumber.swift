//
//  02-AddTwoNumber.swift
//  LeetCodeProblem
//
//  Created by Morshed Alam on 11/4/20.
//  Copyright © 2020 Morshed Alam. All rights reserved.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
 }

extension ListNode: CustomStringConvertible {
  public var description: String {
    guard let next = next else {
      return "\(val)"
    }
return "\(val) -> " + String(describing: next) + " " }
}

// 2->4->3  and 5->6->-4->

func addTwoNumbers(_ l1: inout ListNode?, _ l2: inout ListNode?) -> ListNode? {
    var carryOver = 0
    var head:ListNode?
    var tail:ListNode?
    while  l1 != nil ||   l2 != nil {
        var val = carryOver
        if l1 != nil{
            val += l1!.val
            l1 = l1?.next
        }
        if l2 != nil{
            val += l2!.val
            l2 = l2?.next
        }
        carryOver = val/10
        let newNode = ListNode(val%10)
        if head == nil{
            head = newNode
            tail = head
        }else{
            tail?.next = newNode
            tail = newNode
        }
    }
    if carryOver > 0{
        tail?.next = ListNode(carryOver)
    }
    return head
}

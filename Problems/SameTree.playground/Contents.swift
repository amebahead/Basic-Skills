// Leetcode

import Foundation
import UIKit
import SwiftUI
import PlaygroundSupport
import XCTest

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }

        if let p, let q, p.val == q.val {
            return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
        } else {
            return false
        }
    }


    /*
    var result: Bool = true
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        recursiveTree(p, q)
        return result
    }

    func recursiveTree(_ p: TreeNode?, _ q: TreeNode?) {
        guard let p = p else { return }
        guard let q = q else { return }

        print(p.val, q.val)

        if p.val == q.val {
            recursiveTree(p.left, q.left)
            recursiveTree(q.right, q.right)
        } else {
            result = false
            return
        }
    }
    */
}

let node4a = TreeNode(4)
let node5a = TreeNode(5)
let node2a = TreeNode(2, node4a, node5a)
let node3a = TreeNode(3)
let rootA = TreeNode(1, node2a, node3a)

let node4b = TreeNode(4)
let node5b = TreeNode(5)
let node2b = TreeNode(2, node4b, node5b)
let node3b = TreeNode(3)
let rootB = TreeNode(1, node2b, node3b)


let solution = Solution()
let result = solution.isSameTree(rootA, rootB)
print(result)









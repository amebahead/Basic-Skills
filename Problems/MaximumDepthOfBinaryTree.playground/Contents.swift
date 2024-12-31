// Leetcode 104 Maximum Depth of Binary Tree

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

/*
 * Solution 1
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        return recursive(node: root, depth: 0)
    }

    func recursive(node: TreeNode?, depth: Int) -> Int {
        guard let node = node else { return depth }
        return max(recursive(node: node.left, depth: depth + 1), recursive(node: node.right, depth: depth + 1))
    }

}
*/

// Solution 2
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
}


let node4a = TreeNode(4)
let node5a = TreeNode(5)
let node2a = TreeNode(2, node4a, node5a)
let node3a = TreeNode(3)
let rootA = TreeNode(1, node2a, node3a)

let solution = Solution()
let result = solution.maxDepth(rootA)
print(result)






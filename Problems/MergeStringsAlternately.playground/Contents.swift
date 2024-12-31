
// Leetcode 1768 Merge Strings Alternately

import Foundation
import UIKit
import SwiftUI
import PlaygroundSupport
import XCTest

let word1 = "ab"
let word2 = "pqrs"

let word1Arr: [Character] = word1.map { $0 }
let word2Arr: [Character] = word2.map { $0 }

/*
 * Solution 1.
var i = 0
var result: String = ""

while true {
    if i < word1Arr.count {
        let str1 = String(word1Arr[i])
        result.append(str1)
    }
    if i < word2Arr.count {
        let str2 = String(word2Arr[i])
        result.append(str2)
    }

    if i >= word1Arr.count && i >= word2Arr.count {
        break
    }
    i += 1
}
print(result)
 */

// Solution 2
var l = 0
var r = 0
var result = ""

while l < word1Arr.count && r < word2Arr.count {
    result += String(word1Arr[l])
    result += String(word2Arr[r])

    l += 1
    r += 1
}

while l < word1Arr.count {
    result += String(word1Arr[l])
    l += 1
}

while r < word2Arr.count {
    result += String(word2Arr[r])
    r += 1
}

print(result)




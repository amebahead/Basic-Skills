// Leetcode 121 Best Time to Buy and Sell Stock

import Foundation
import UIKit
import SwiftUI
import PlaygroundSupport
import XCTest

let s1 = "ab"
let s1Arr = Array(s1)
let s1Length = s1Arr.count
var s1CharSum = 0

let s2 = "eidboaoo"
let s2Arr = Array(s2)
let s2Length = s2Arr.count

//let s3 = "eidboaoo"

var isPermutation = false

for sChar in s1Arr {
    if let asciiValue = sChar.asciiValue {
        s1CharSum += Int(asciiValue)
    }
}
//print(s1CharSum)
//print("")

var pivot = 0
for i in pivot ..< s2Length - s1Length {
    var charSum = 0
    for j in pivot ..< pivot + s1Length {
        if let asciiValue = s2Arr[j].asciiValue {
            charSum += Int(asciiValue)
        }
    }
//    print(charSum)
    if s1CharSum == charSum {
        isPermutation = true
        break
    }
    pivot += 1
}

print(isPermutation)

// https://programmers.co.kr/learn/courses/30/lessons/60057ka

import Foundation
import UIKit
import SwiftUI
import PlaygroundSupport
import XCTest

// abcabcabcabcdededededede
//func solution(_ s:String) -> Int {
//
//    let string = s
//    let length = string.count
//
//    for i in 1 ... length {
//        let bufferCnt = i
//        var startIndex = string.startIndex
//        let range = string.index(after: startIndex) ..< 5
//    }
//
//
//
//    return 0
//}
//
//solution("abcabcabcabcdededededede")

//var temp = ""
//temp.append("1")
//temp.append("2")
//temp.append("3")
//
//let foo = String(4)
//temp.append(foo)
//
//print(temp)

/*
let bufferCnt = 3
let foo = "abcabcabcabcdededededede"

var index = 0
var start = foo.index(foo.startIndex, offsetBy: 0)
var end = foo.index(foo.startIndex, offsetBy: 0)

var current = Substring()
var buffer = Substring()
var count = 1
var encodingString = ""

while index < foo.count {
    start = foo.index(foo.startIndex, offsetBy: index)
    end = foo.index(start, offsetBy: bufferCnt)

    let range = start ..< end
    let result = foo[range]
//    print(result)
    
    if buffer.isEmpty {
        buffer = result
    } else {
        // 버퍼가 있으면
        current = result
        
        // Compare
        if buffer == current {
            // 같으면
            count += 1
        } else {
            // 틀리면
            if count > 1 {
                let countStr = "\(count)"
                encodingString.append(countStr)
            }
            encodingString.append(contentsOf: buffer)
            
            // clear
            count = 1
        }
        
        buffer = current
    }

    index += bufferCnt
}

if count > 1 {
    let countStr = "\(count)"
    encodingString.append(countStr)
    encodingString.append(contentsOf: buffer)
} else {
    encodingString.append(contentsOf: buffer)
}

print(foo)
print(encodingString)
*/


/*
for i in 2...6 {
    var index = 0
    var start = foo.index(foo.startIndex, offsetBy: 0)
    var end = foo.index(foo.startIndex, offsetBy: 0)
    
    print("====\(i)====")
    while index < foo.count {
        if index > foo.count / 2 {
            start = end
            end = foo.endIndex
            
            let range = start ..< end
            let result = foo[range]
            print(result)
            
            print("=========")
            break
        } else {
            start = foo.index(foo.startIndex, offsetBy: index)
            end = foo.index(start, offsetBy: i)

            let range = start ..< end
            let result = foo[range]
            print(result)
            
            index += i
        }
    }
}
*/


// Pascal's Triangle
/*
func pascalTriangle(n: Int) {
    for line in 1 ... n {
        var c = 1
        for i in 1 ... line {
            print(c)
            c = c * (line - i) / i
//            print(c)
        }
        print("")
    }
}

pascalTriangle(n: 6)
*/

func pascalTriangle(n: Int) -> [[Int]] {
    var resultArr = [[Int]]()
    
    if n == 1 {
        return [[1]]
    }
    
    if n == 2 {
        return [[1], [1, 1]]
    }
    
    resultArr = [[1], [1, 1]]
    
    for i in 3...n {
        let thisArr = resultArr[i - 2]
        var nextArr: [Int] = [1]
        var prevValue: Int? = nil
        
        for (index, value) in thisArr.enumerated() {
            let thisValue = thisArr[index]
//            print(i, index, thisValue)
            
            if let pValue = prevValue {
                let newValue = pValue + thisValue
                nextArr.append(newValue)
            }
            
            prevValue = thisValue
        }
        
        nextArr.append(1)
        resultArr.append(nextArr)
        
//        print("")
    }
    
    return resultArr
}

let result = pascalTriangle(n: 50)
print(result.last)
print(result.last?.count)

// https://programmers.co.kr/learn/courses/30/lessons/77484?language=swift

import Foundation
import UIKit
import SwiftUI
import PlaygroundSupport
import XCTest

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
//    print(lottos)
//    print(win_nums)
    
    let lottos = lottos
    let wins = win_nums
    
    var zeroCount = 0
    var matchCount = 0
    
    for lotto in lottos {
        // get zero count
        if lotto == 0 {
            zeroCount += 1
        } else {
            // compare
            for win in wins {
                if lotto == win {
                    matchCount += 1
                }
            }
        }
    }
    
    let bestCount = matchCount + zeroCount
    let worstCount = matchCount
    
    // result
    var bestResult = 0
    var worstResult = 0
    
    bestResult = resultMapping(count: bestCount)
    worstResult = resultMapping(count: worstCount)
    
    return [bestResult, worstResult]
}

func resultMapping(count: Int) -> Int {
    switch count {
    case 6:
        return 1
    case 5:
        return 2
    case 4:
        return 3
    case 3:
        return 4
    case 2:
        return 5
        
    default:
        return 6
    }
}


let result = solution([0, 0, 0, 0, 0, 0], [31, 10, 45, 1, 6, 19])
print(result)

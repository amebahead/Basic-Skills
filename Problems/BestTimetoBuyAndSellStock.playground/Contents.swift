// Leetcode 121 Best Time to Buy and Sell Stock

import Foundation
import UIKit
import SwiftUI
import PlaygroundSupport
import XCTest

var maxProfit = -99999
let prices: [Int] = [7, 1, 5, 3, 6, 4]

func calculateStockProfit(i: Int) {
    guard i != prices.count else { return }
    for j in i + 1..<prices.count {
//        print("\(i), \(j)")
        let profit = prices[j] - prices[i]
        if profit > maxProfit {
            maxProfit = profit
        }
    }

//    print("\n\n")
    calculateStockProfit(i: i + 1)
}

calculateStockProfit(i: 0)

print(maxProfit)


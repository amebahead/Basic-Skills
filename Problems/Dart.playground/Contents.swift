// Dart
// https://tech.kakao.com/2017/09/27/kakao-blind-recruitment-round-1/

import Foundation

// 37
//var scoreArr = ["1", "S", "2", "D", "*", "3", "T"]
// 9
//var scoreArr = ["1", "D", "2", "S", "#", "1", "0", "S"]
// 3
//var scoreArr = ["1", "D", "2", "S", "0", "T"]
// 23
//var scoreArr = ["1", "S", "*", "2", "T", "*", "3", "S"]
// 5
//var scoreArr = ["1", "D", "#", "2", "S", "*", "3", "S"]
// -4
//var scoreArr = ["1", "T", "2", "D", "3", "D", "#"]
// 59
var scoreArr = ["1", "D", "2", "S", "3", "T", "*"]


var totalSumArr = [0, 0, 0]
var optionArr = ["0", "0", "0"]

var inx = -1

// Function
func isNumber(score: String) -> Bool {
    switch score {
    case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" :
        return true
    default:
        return false
    }
}

func isBonus(score: String) -> Bool {
    switch score {
    case "S", "D", "T" :
        return true
    default:
        return false
    }
}

func isOption(score: String) -> Bool {
    switch score {
    case "*", "#" :
        return true
    default:
        return false
    }
}

func pow(_ x: Int, _ y: Int) -> Int {
    var res = 1
    for _ in 0..<y {
        res = res * x
    }
    return res
}

func totalAmtCount() -> Int {
    var res = 0
    
    for i in 0..<3 {
        let sum = totalSumArr[i]
        let option = optionArr[i]
        
        switch option {
        case "0":
            break
        case "1":
            totalSumArr[i] = sum * 2
        case "2":
            totalSumArr[i] = sum * 4
        case "4":
            totalSumArr[i] = sum * -1
        case "5":
            totalSumArr[i] = sum * -2
            
        default:
            break
        }
    }
    
    // 합산
    for val in totalSumArr {
        res = res + val
    }
    
    return res
}

// Main
for i in 0..<scoreArr.count {
//    print(scoreArr[i])
    
    let thisScore = scoreArr[i]
    if isNumber(score: thisScore) {
        let score = Int(thisScore)!
        if score == 0 {
            if inx == -1 {
                inx = inx + 1
                totalSumArr[inx] = 0
            }
            else {
                if totalSumArr[inx] != 1 {
                    inx = inx + 1
                    totalSumArr[inx] = 0
                }
                else {
                    totalSumArr[inx] = 10
                }
            }
        }
        else {
            inx = inx + 1
            totalSumArr[inx] = score
        }
    }
    else if isBonus(score: thisScore) {
        var bonusScore = 0
        let thisTotalSum = totalSumArr[inx]
        
        print("")
        print(inx)
        print(thisTotalSum)
        print("")
        
        switch thisScore {
        case "S":
            bonusScore = pow(thisTotalSum, 1)
        case "D":
            bonusScore = pow(thisTotalSum, 2)
        case "T":
            bonusScore = pow(thisTotalSum, 3)
        default:
            break
        }
        
        totalSumArr[inx] = bonusScore
        
    }
    else if isOption(score: thisScore)  {
        
        switch thisScore {
        case "*":
            // inx가 0일때
            if inx == 0 {
                optionArr[inx] = "1"
            }
            else {
                let pastOption = optionArr[inx-1]
                
                // 아무것도 없을 때
                if pastOption == "0" {
                    optionArr[inx-1] = "1"
                }
                    // 기존에 *일 경우
                else if pastOption == "1" {
                    optionArr[inx-1] = "2"
                }
                    // 기존에 #일 경우
                else if pastOption == "4" {
                    optionArr[inx-1] = "5"
                }
                
                optionArr[inx] = "1"
            }
            
        case "#":
            optionArr[inx] = "4"
            
        default:
            break
        }
    }
    
}

print("result: \(totalAmtCount())")
totalSumArr
optionArr
























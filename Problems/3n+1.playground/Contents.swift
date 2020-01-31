import Foundation

// 3n+1
func cycle(num: Int) -> Int {
    var cnt = 1
    var target = num
    
//    print(target)
    while target != 1 {
        if target % 2 == 0 {
            // even
            target /= 2
        }
        else {
            // odd
            target = target * 3 + 1
        }
//        print(target)
        cnt += 1
    }
    
    return cnt
}

func entireCycle(i: Int, j: Int) -> Int {
    var maxResult = 0
    
    var a = i
    var b = j
    var temp = 0
    
    if a > b {
        temp = a
        a = b
        b = temp
    }
    
    for num in a...b {
        let res = cycle(num: num)
        if res > maxResult {
            maxResult = res
        }
        
//        print("")
//        print("============")
//        print("")
    }
    
    return maxResult
}

// Main
while let lineStr = readLine() {
    let lineArr = lineStr.split(separator: " ").map{Int(String($0))!}
    let a = lineArr[0]
    let b = lineArr[1]
    let c = entireCycle(i: a, j: b)
    
    print("\(a) \(b) \(c)")
}

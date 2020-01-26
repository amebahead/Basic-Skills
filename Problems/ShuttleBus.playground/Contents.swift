//: Playground - noun: a place where people can play

import Foundation

func convertToSec(time: String) -> Int {
    let splitTime = time.split(separator: ":")
    let hour = Int(splitTime[0])
    let min = Int(splitTime[1])
    let calcuSec = (hour! * 3600) + (min! * 60)
    
    return calcuSec
}

func returnToTime(sec: Int) -> String {
    let transMin = sec / 60
    let transHour = transMin / 60
    let remainMin = transMin % 60
    
    var hour = String(describing: transHour)
    var min = String(describing: remainMin)
    
    if transHour < 10 {
        hour = "0\(String(describing: transHour))"
    }
    
    if remainMin < 10 {
        min = "0\(String(describing: remainMin))"
    }
    
    let timeStr = "\(hour):\(min)"
    
    return timeStr
}

//let convertSec = convertToSec(time: "09:36")
//let convertSec = convertToSec(time: "18:16")
//let convertSec = convertToSec(time: "12:06")
//let convertSec = convertToSec(time: "01:26")
//let timeStr = returnToTime(sec: convertSec)

let timeTable = ["09:10", "09:09", "08:00"]
let timeTableToSec =  timeTable.map { (time) -> Int in
    return convertToSec(time: time)
}
//print(timeTableToSec)


// Sort
func insertSort(timeArr: [Int]) -> [Int] {
    var sortedArr = [Int]()
    
    for time in timeArr {
        let thisTime = time
        let compareCnt = sortedArr.count
        var insertInx = compareCnt
        
        for cInx in (0..<compareCnt).reversed() {
            let compareTime = sortedArr[cInx]
            if compareTime >= thisTime {
                insertInx = cInx
            }
        }
        // insert
        sortedArr.insert(thisTime, at: insertInx)
    }
    
    return sortedArr
}

//print("###")
//print(timeTableToSec)
//print("###")

//let sortedTimeTableToSec = insertSort(timeArr: timeTableToSec)
//print(sortedTimeTableToSec)


// Calculate Shuttle Algorithm
func calcuShuttleLastTime(n: Int, t: Int, m: Int, timeTable: [Int]) -> String {
    let startSec = convertToSec(time: "09:00")
    let endSec = convertToSec(time: "23:59")
    let periodTimeToSec = t * 60
    var stopPoint = [Int]()
    var crewArr = timeTable
    
    // Make StopPoint
    for inx in 0...n {
        let stopSec = startSec + (periodTimeToSec * inx)
        stopPoint.append(stopSec)
    }
    
    // Ride Crew
    for sPoint in stopPoint {
        var capacity = 0
        for (inx, crew) in crewArr.enumerated() {
            if sPoint >= crew {
                // Limit m
                if m > capacity {
                    // Ride
                    crewArr.remove(at: inx)
                    capacity += 1
                    continue
                }
            }
            else {
                break
            }
        }
    }
    
    
    return ""
}

// Main
let n = 2
let t = 10
let m = 2
let timeTableArr = ["09:00", "09:09", "08:00"]

let convertTimeTableSecArr = timeTableArr.map { (time) -> Int in
    return convertToSec(time: time)
}
let sortedSecTimeTableArr = insertSort(timeArr: convertTimeTableSecArr)
print(sortedSecTimeTableArr)












// Test For Loop
/*
let temp = 1
for inx in 0...temp {
    print(inx)
}
*/

var tempArr = [0,1,2,3,4,5]
for (inx, foo) in tempArr.enumerated() {
    print(foo)
    tempArr.remove(at: inx)
}
















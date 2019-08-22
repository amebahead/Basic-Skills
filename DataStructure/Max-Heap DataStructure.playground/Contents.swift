/*
    Date: 2019.08.21
    Developer: AmebaHead
    Description: Max-Heap DataStructure
*/

import Foundation

class AlgorithmHelper {
    static func generateRandomNumber(max: Int) -> Int {
        return Int.random(in: 1..<max)
    }
    
    static func generateSpecificNumber(inx : Int) -> Int {
        let specificArr = [7, 5, 8, 7, 4, 9, 9, 7, 7, 6]
        
        return specificArr[inx]
    }
}

struct Node {
    var weight: Int = 0
}

struct MaxHeap {
    var lastIndex: Int = 1
    var dataSource: [Node]
    
    init() {
        self.dataSource = [Node(weight: 0)]
    }
    
    // MARK: - Insert
    mutating func insert(newNode: Node) {
        self.dataSource.insert(newNode, at: lastIndex)
        
        var inx = self.lastIndex
        while inx > 1 {
            // Compare ParentNode to DescentNode
            // ParentNode < DescentNode
            if self.dataSource[inx / 2].weight < self.dataSource[inx].weight {
                // swap
                self.dataSource.swapAt(inx / 2, inx)
            }
            // ParentNode >= DescentNode
            else {
                break
            }
            inx = inx / 2
        }
        
        self.lastIndex += 1
    }
    
    // MARK: - delete
    mutating func delete() -> (result: Bool, msg: String) {
        if self.lastIndex < 2 {
            return (false, "Heap is Empty")
        }
        
        // Delete Peek Node
        // Insert lastIndex Node to Peek
        self.dataSource[1] = self.dataSource[self.lastIndex - 1]
        self.dataSource.removeLast()
        self.lastIndex -= 1
        
        // ReArrange Nodes
        var inx: Int = 1
        while inx <= self.lastIndex {
            
            let leftInx = 2 * inx
            let rightInx = 2 * inx + 1
            
            let leftNodeExist = self.dataSource.indices.contains(leftInx)
            let rightNodeExist = self.dataSource.indices.contains(rightInx)
            
            // Only leftNode
            if leftNodeExist == true && rightNodeExist == false {
                // Left DescentNode > ParentNode
                if self.dataSource[leftInx].weight > self.dataSource[inx].weight {
                    self.dataSource.swapAt(leftInx, inx)
                    inx = leftInx
                    continue
                }
            }
            // Only rightNode
            else if leftNodeExist == false && rightNodeExist == true {
                // Right DescentNode > ParentNode
                if self.dataSource[rightInx].weight > self.dataSource[inx].weight {
                    self.dataSource.swapAt(rightInx, inx)
                    inx = rightInx
                    continue
                }
            }
            
            // Both leftNode && rightNode
            else if leftNodeExist == true && rightNodeExist == true {
                // Compare leftNode to rightNode
                // leftNode > rightNode
                if self.dataSource[leftInx].weight > self.dataSource[rightInx].weight {
                    // Left DescentNode > ParentNode
                    if self.dataSource[leftInx].weight > self.dataSource[inx].weight {
                        self.dataSource.swapAt(leftInx, inx)
                        inx = leftInx
                        continue
                    }
                }
                // leftNode < rightNode
                else if self.dataSource[leftInx].weight < self.dataSource[rightInx].weight {
                    // Right DescentNode > ParentNode
                    if self.dataSource[rightInx].weight > self.dataSource[inx].weight {
                        self.dataSource.swapAt(rightInx, inx)
                        inx = rightInx
                        continue
                    }
                }
                // leftNode == rightNode
                else {
                    // Left DescentNode > ParentNode
                    if self.dataSource[leftInx].weight > self.dataSource[inx].weight {
                        self.dataSource.swapAt(leftInx, inx)
                        inx = leftInx
                        continue
                    }
                }
            }
            
            // Neither leftNode && rightNode
            else if leftNodeExist == false && rightNodeExist == false {
                break
            }
            
            // ParentNode >= leftNode || rightNode
            break
        }
        
        return (true, "Success")
    }
    
    // MARK: - shoot
    func shoot() {
        for (inx, element) in self.dataSource.enumerated() {
            print("index: \(inx), weight: \(element)")
        }
    }
    
    // MARK: - peek
    func peek() -> Node {
        return self.dataSource[1]
    }
}




// Main
var dataMax = MaxHeap()
var dummyArr = [Int]()

// insert
for i in 0..<10 {
    let randomNum = AlgorithmHelper.generateRandomNumber(max: 10)
//    let randomNum = AlgorithmHelper.generateSpecificNumber(inx: i)
    let newNode = Node(weight: randomNum)
    dataMax.insert(newNode: newNode)
    
    dummyArr.append(randomNum)
}

// insert Data
for data in dummyArr {
    print("\(data)")
}

print("=====================")

// peek
let peek = dataMax.peek()
print(peek.weight)

// shoot
dataMax.shoot()

// delete
for inx in 1..<11 {
    let result = dataMax.delete()
    if result.result {
        print("Success Delete \(inx)")
        print("")
        // shoot
        dataMax.shoot()
    }
}





























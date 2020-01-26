// Cache (LRU)
// https://tech.kakao.com/2017/09/27/kakao-blind-recruitment-round-1/

import Foundation

class Node {
    var value: String
    var prev: Node?
    var next: Node?
    
    init(value: String) {
        self.value = value
        self.prev = nil
        self.next = nil
    }
}

class CacheSystemUsingLRU {
    var head: Node
    var tail: Node
    
    var count: Int
    private var weight: Int
    
    init() {
        self.head = Node(value: "head")
        self.tail = Node(value: "tail")
        self.head.next = self.tail
        self.tail.prev = self.head
        
        self.count = 0
        self.weight = 0
    }
    
    func seek(value: String) -> Node? {
        var node = self.head.next
        while true {
            if let thisNode = node {
                if thisNode.value == value {
                    return thisNode
                }
                else {
                    node = node?.next
                }
            }
            else {
                return nil
            }
        }
    }
    
    func insert(node: Node) {
        node.next = self.head.next
        self.head.next?.prev = node
        
        self.head.next = node
        node.prev = head
        
        self.count += 1
    }
    
    func delete(node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        self.count -= 1
    }
    
    func deleteTailNode() {
        var node = self.head.next
        
        while true {
            if let thisNode = node {
                if thisNode.value == "tail" {
                    if let delNode = thisNode.prev {
                        delNode.prev?.next = delNode.next
                        delNode.next?.prev = delNode.prev
                        self.count -= 1
                    }
                    
                }
                else {
                    node = node?.next
                }
            }
        }
    }
    
    func shoot() {
        var node = self.head.next
        
        while true {
            if let thisNode = node {
                if thisNode.value == "tail" {
                    break
                }
                else {
                    print("node: \(thisNode.value)")
                    node = node?.next
                }
            }
        }
    }
    
    func getWeight() -> Int {
        return self.weight
    }
    
    func increaseWeight(value: Int) {
        self.weight += value
    }
}


// Main Process
//let capacity = 3
//let datas = ["J", "P", "S", "J", "P", "S", "J", "P", "S"]

let capacity = 2
let datas = ["J", "P", "N", "N"]


var cache = CacheSystemUsingLRU()

for data in datas {
    if let node = cache.seek(value: data) {
        // Hit
        cache.delete(node: node)
        cache.insert(node: node)
        cache.increaseWeight(value: 1)
    }
    else {
        // Miss
        if cache.count <= capacity {
            // Under
            let newNode = Node(value: data)
            cache.insert(node: newNode)
            cache.increaseWeight(value: 5)
        }
        else {
            // Over
            let newNode = Node(value: data)
            // 맨 마지막 node 제거
            cache.deleteTailNode()
            
            cache.insert(node: newNode)
            cache.increaseWeight(value: 5)
        }
    }
}

cache.getWeight()






















































































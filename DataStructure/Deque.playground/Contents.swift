/*
 Date: 2023.01.24
 Description: Deque
 Reference: https://icksw.tistory.com/213
 */

import Foundation

class Deque<T: Equatable> {
  var enqueue: [T]
  var dequeue: [T] = []

  var count: Int {
    return enqueue.count + dequeue.count
  }

  var isEmpty: Bool {
    return enqueue.isEmpty && dequeue.isEmpty
  }

  var first: T? {
    if dequeue.isEmpty {
      return enqueue.first
    }
    return dequeue.last
  }

  init(_ queue: [T]) {
    enqueue = queue
  }

  func pushFirst(_ n: T) {
    dequeue.append(n)
  }

  func pushLast(_ n: T) {
    enqueue.append(n)
  }

  func popFirst() -> T? {
    if dequeue.isEmpty {
      dequeue = enqueue.reversed()
      enqueue.removeAll()
    }
    return dequeue.popLast()
  }

  func popLast() -> T? {
    var returnValue: T?
    if enqueue.isEmpty {
      dequeue.reversed()
      returnValue = dequeue.popLast()
      dequeue.reversed()
    } else {
      returnValue = enqueue.popLast()
    }
    return returnValue
  }

  func contain(_ n: T) -> Bool {
    return enqueue.contains(n) || dequeue.contains(n)
  }

  func removeAll() {
    enqueue.removeAll()
    dequeue.removeAll()
  }
}


let dummy = [1, 2, 3, 4, 5]
let dequeue = Deque<Int>(dummy)

print(dequeue.popFirst())
print(dequeue.popLast())
















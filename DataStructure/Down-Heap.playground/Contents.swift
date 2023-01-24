/*
 Date: 2023.01.24
 Description: Down-Heap
 Reference: https://velog.io/@qwer15417/Swift-Heap
 */

import Foundation

class BinaryHeap {
  var items = [Int]()

  init(_ val: Int) {
    items.append(val)
    items.append(val)
  }

  func percolate_up() {
    var i = items.count - 1
    var parent = Int(i / 2)
    while parent > 0 {
      if items[i] < items[parent] {
        items.swapAt(i, parent)
      }
      i = parent
      parent = Int(i / 2)
    }
  }

  func insert(k: Int) {
    items.append(k)
    percolate_up()
  }

  func percolate_down(idx: Int) {
    let left = idx * 2
    let right = idx * 2 + 1
    var smallest = idx

    if left <= items.count - 1 && items[left] < items[smallest] {
      smallest = left
    }

    if right <= items.count - 1 && items[right] < items[smallest] {
      smallest = right
    }

    if smallest != idx {
      items.swapAt(idx, smallest)
      percolate_down(idx: smallest)
    }
  }

  func exrtract() -> Int {
    let extracted = items[1]
    items[1] = items[items.count - 1]
    items.popLast()
    percolate_down(idx: 1)

    return extracted
  }
}

let dummy = [10, 5, 1, 50, 26, 25, 7, 111, 99]
let bh = BinaryHeap(0)

for dmy in dummy {
  bh.insert(k: dmy)
}

print(bh.items)

print(bh.exrtract())
print(bh.exrtract())
print(bh.exrtract())
print(bh.exrtract())

print(bh.items)




















/*
 Date: 2023.01.24
 Description: DFS & BFS
 Reference: https://nareunhagae.tistory.com/56
 */

import Foundation

struct Queue<T> {
  var array = [T]()

  var isEmpty: Bool {
    return array.isEmpty
  }

  var count: Int {
    return array.count
  }

  mutating func enqueue(_ element: T) {
    array.append(element)
  }

  mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
}

let graph = [
    [], // 0
    [2,3], // 1
    [1,4,5], // 2
    [1,6,7], // 3
    [2], // 4
    [2], // 5
    [3], // 6
    [3,8], // 7
    [7] // 8
]
var visited = Array.init(repeating: false, count: graph.count)
var queue = Queue<Int>()


func dfs(start: Int) {
  visited[start] = true
  print(start, terminator: " ")

  for i in graph[start] {
    if !visited[i] {
      dfs(start: i)
    }
  }
}

func bfs(start: Int) {
  queue.enqueue(start)
  visited[start] = true

  while !queue.isEmpty {
    guard let elem = queue.dequeue() else { return }
    print(elem, terminator: " ")

    for i in graph[elem] {
      if !visited[i] {
        queue.enqueue(i)
        visited[i] = true
      }
    }
  }
}


//dfs(start: 1)
bfs(start: 1)











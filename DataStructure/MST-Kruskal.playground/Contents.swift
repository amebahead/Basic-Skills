/*
 Date: 2023.01.24
 Description: MST(Minimum Spanning Tree) Kruskal's Algorithm
 Reference: https://babbab2.tistory.com/111
 */

import Foundation

let vertices = ["A", "B", "C", "D"]
let edges = [
  (5,  "A", "B"),
  (1,  "A", "C"),
  (10, "A", "D"),
  (5,  "B", "A"),
  (3,  "B", "D"),
  (1,  "C", "A"),
  (8,  "C", "D"),
  (10, "D", "A"),
  (3,  "D", "B"),
  (8,  "D", "C"),
]

typealias edge = (Int, String, String)

func kruskal(vertices: [String], edges: [edge]) -> [edge] {
  var mst: [edge] = []

  var edges = edges.sorted { $0.0 < $1.0 }
  var rank: [String: Int] = [:]
  var parent: [String: String] = [:]

  for vertice in vertices {
    rank.updateValue(0, forKey: vertice)
    parent.updateValue(vertice, forKey: vertice)
  }

  func find(_ node: String) -> String {
    if node != parent[node]! {
      parent[node] = find(parent[node]!)
    }
    return parent[node]!
  }

  /*
   func union(_ nodeV: String, _ nodeU: String) {
   let rankV = find(nodeV)
   let rankU = find(nodeU)

   if rankV > rankU {
   parent[rankU] = rankV
   } else {
   parent[rankV] = nodeU
   if rankV == rankU {
   rank[nodeU]! += 1
   }
   }
   }
   */

  func union_renewal(_ nodeV: String, _ nodeU: String) {
    let rootV = find(nodeV)
    let rootU = find(nodeU)

    let rankV = rank[rootV]!
    let rankU = rank[rootU]!

    if rankV > rankU {
      parent[nodeU] = nodeV
    } else if rankV < rankU {
      parent[nodeV] = nodeU
    } else if rankV == rankU {
      parent[nodeV] = nodeU
      rank[rootU]! += 1
    }
  }

  while mst.count < (vertices.count - 1) {
    let node = edges.removeFirst()
    if find(node.1) != find(node.2) {
      union_renewal(node.1, node.2)
      mst.append(node)
    }
  }
  return mst
}

let mst = kruskal(vertices: vertices, edges: edges)
print(mst)


























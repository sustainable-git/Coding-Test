// 크루스칼 알고리즘
// https://fomaios.tistory.com/entry/프로그래머스-섬-연결하기-Swift

import Foundation

var parent: [Int] = []

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var result: Int = 0
    
    parent = (0..<n).map { $0 }
    let probablePathSortedByCost = costs.sorted(by: { $0[2] < $1[2] })
    
    for path in probablePathSortedByCost {
        if !isCircle(path[0], path[1]) {
            bridge(path[0], path[1])
            result += path[2]
        }
    }
    
    return result
}

func isCircle(_ leftIndex: Int, _ rightIndex: Int) -> Bool {
    return parent[leftIndex] == parent[rightIndex]
}

func bridge(_ leftIndex: Int, _ rightIndex: Int) {
    parent.indices.filter {
        parent[$0] == parent[rightIndex]
    }.forEach {
        parent[$0] = parent[leftIndex]
    }
}

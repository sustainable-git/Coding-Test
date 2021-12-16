import Foundation

var directions: [(Int, Int)] = [(-1, 0), (0, -1), (1, 0), (0, 1)]
var minCost: [[Int?]] = []

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    minCost = Array(repeating: Array(repeating: nil, count: n), count: n)
    var result: Int = n * n * 600
    bruteFource(n: n, pastDirection: (1, 0), from: (0, 0), visited: board, cost: 0, result: &result)
    bruteFource(n: n, pastDirection: (0, 1), from: (0, 0), visited: board, cost: 0, result: &result)
    
    return result
}

func bruteFource(n: Int, pastDirection: (Int, Int), from: (Int, Int), visited: [[Int]], cost: Int, result: inout Int) {
    guard cost < result else { return }
    if let pastMinCost = minCost[from.0][from.1] {
        if cost <= pastMinCost + 500 {
            minCost[from.0][from.1] = min(pastMinCost, cost)
        } else {
            return
        }
    } else {
        minCost[from.0][from.1] = cost
    }
    if from == (n-1, n-1) {
        result = min(cost, result)
        return
    }
    
    for direction in directions {
        let to: (Int, Int) = (from.0 + direction.0, from.1 + direction.1)
        guard 0..<n ~= to.0, 0..<n ~= to.1,
              visited[to.0][to.1] != 1
        else { continue }
        var futureVisited: [[Int]] = visited
        futureVisited[to.0][to.1] = 1
        
        if pastDirection == direction {
            bruteFource(n: n, pastDirection: direction, from: to, visited: futureVisited, cost: cost+100, result: &result)
        } else {
            bruteFource(n: n, pastDirection: direction, from: to, visited: futureVisited, cost: cost+600, result: &result)
        }
    }
}

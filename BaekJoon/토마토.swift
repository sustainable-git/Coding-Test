import Foundation

struct Node: Hashable {
    let row: Int
    let col: Int
}
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

let MN = readLine()!.split(separator: " ").map { Int(String($0))! }
var matrix: [[Int]] = []


(0..<MN[1]).forEach { _ in
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    matrix.append(arr)
}

func solution(matrix: [[Int]]) -> Int {
    var startNode: [Node] = []
    for row in 0..<matrix.count {
        for col in 0..<matrix[row].count {
            if matrix[row][col] == 1 {
                let node = Node(row: row, col: col)
                startNode.append(node)
            }
        }
    }
    var dayArr: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
    var visited: Set<Node> = []
    startNode.forEach {
        visited.update(with: $0)
    }
    var queue: [Node] = startNode
    var maxDay: Int = 0
    var index: Int = 0

    while index < queue.count {
        defer { index += 1 }
        let currentNode = queue[index]
        
        (0..<4).forEach {
            let row = currentNode.row + dx[$0]
            let col = currentNode.col + dy[$0]
            let newNode = Node(row: row, col: col)
            if 0..<matrix.count ~= row &&
                0..<matrix[0].count ~= col &&
                matrix[row][col] == 0 &&
                !visited.contains(newNode) {
                queue.append(newNode)
                visited.update(with: newNode)
                dayArr[row][col] = dayArr[currentNode.row][currentNode.col] + 1
                maxDay = dayArr[newNode.row][newNode.col]
            }
        }
    }


    for row in 0..<matrix.count {
        for col in 0..<matrix[row].count {
            if matrix[row][col] == 0 {
                let node = Node(row: row, col: col)
                if !visited.contains(node) {
                    return -1
                }
            }
        }
    }

    return maxDay
}

print(solution(matrix: matrix))

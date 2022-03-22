import Foundation

struct Node: Hashable {
    let row: Int
    let col: Int
    let height: Int
}
let dx = [-1, 0, 1, 0, 0, 0]
let dy = [0, 1, 0, -1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]

let MNH = readLine()!.split(separator: " ").map { Int(String($0))! }
var triMatrix: [[[Int]]] = []

(0..<MNH[2]).forEach { _ in
    var matrix: [[Int]] = []
    (0..<MNH[1]).forEach { _ in
        let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
        matrix.append(arr)
    }
    triMatrix.append(matrix)
}

func solution(matrix: [[[Int]]]) -> Int {
    var box = matrix
    var startNode: [Node] = []
    for height in 0..<matrix.count {
        for row in 0..<matrix[height].count {
            for col in 0..<matrix[height][row].count {
                if matrix[height][row][col] == 1 {
                    let node = Node(row: row, col: col, height: height)
                    startNode.append(node)
                }
            }
        }
    }
    var dayArr: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: matrix[0][0].count), count: matrix[0].count), count: matrix.count)
    var queue: [Node] = startNode
    var maxDay: Int = 0
    var index: Int = 0

    while index < queue.count {
        defer { index += 1 }
        let currentNode = queue[index]
        
        (0..<6).forEach {
            let row = currentNode.row + dx[$0]
            let col = currentNode.col + dy[$0]
            let height = currentNode.height + dz[$0]
            let newNode = Node(row: row, col: col, height: height)
            if 0..<matrix.count ~= height &&
                0..<matrix[0].count ~= row &&
                0..<matrix[0][0].count ~= col &&
                box[height][row][col] == 0 {
                box[height][row][col] = 1
                queue.append(newNode)
                dayArr[height][row][col] = dayArr[currentNode.height][currentNode.row][currentNode.col] + 1
                maxDay = dayArr[height][row][col]
            }
        }
    }


    for height in 0..<matrix.count {
        for row in 0..<matrix[height].count {
            for col in 0..<matrix[height][row].count {
                if box[height][row][col] == 0 {
                    return -1
                }
            }
        }
    }

    return maxDay
}

print(solution(matrix: triMatrix))

import Foundation

struct Node {
    let row: Int
    let col: Int
}

let RC = readLine()!.split(separator: " ").map{ Int(String($0))! }
var maze = [[String]]()

(0..<RC[0]).forEach { _ in
    let row = readLine()!.map{ String($0) }
    maze.append(row)
}

func solution(maze: [[String]]) -> String {
    let dx = [1, 0, -1, 0]
    let dy = [0, -1, 0, 1]
    var queueOfJihoon = [Node]()
    var pathOfJihoon = Array(repeating: Array(repeating: Int.max, count: maze[0].count), count: maze.count)
    var jihoonIndex = 0
    var queueOfFire = [Node]()
    var pathOfFire = Array(repeating: Array(repeating: Int.max, count: maze[0].count), count: maze.count)
    var fireIndex = 0
    
    for row in 0..<maze.count {
        for col in 0..<maze[row].count {
            if maze[row][col] == "J" {
                let node = Node(row: row, col: col)
                queueOfJihoon.append(node)
            }
            if maze[row][col] == "F" {
                let node = Node(row: row, col: col)
                queueOfFire.append(node)
            }
        }
    }
    queueOfJihoon.forEach { pathOfJihoon[$0.row][$0.col] = 0 }
    queueOfFire.forEach { pathOfFire[$0.row][$0.col] = 0 }
    
    while jihoonIndex < queueOfJihoon.count {
        defer { jihoonIndex += 1 }
        let nodeOfJihoon = queueOfJihoon[jihoonIndex]
        (0..<4).forEach {
            let row = nodeOfJihoon.row + dx[$0]
            let col = nodeOfJihoon.col + dy[$0]
            if 0..<maze.count ~= row && 0..<maze[0].count ~= col &&
                maze[row][col] != "#" && pathOfJihoon[row][col] == Int.max {
                let newNode = Node(row: row, col: col)
                queueOfJihoon.append(newNode)
                pathOfJihoon[row][col] = pathOfJihoon[nodeOfJihoon.row][nodeOfJihoon.col] + 1
            }
        }
    }
    
    while fireIndex < queueOfFire.count {
        defer { fireIndex += 1 }
        let nodeOfFire = queueOfFire[fireIndex]
        (0..<4).forEach {
            let row = nodeOfFire.row + dx[$0]
            let col = nodeOfFire.col + dy[$0]
            if 0..<maze.count ~= row && 0..<maze[0].count ~= col &&
                maze[row][col] != "#" && pathOfFire[row][col] == Int.max {
                let newNode = Node(row: row, col: col)
                queueOfFire.append(newNode)
                pathOfFire[row][col] = pathOfFire[nodeOfFire.row][nodeOfFire.col] + 1
            }
        }
    }
    
    var min = Int.max
    for row in 0..<maze.count {
        for col in 0..<maze[row].count {
            if row == 0 || col == 0 || row == maze.count - 1 || col == maze[row].count - 1 {
                if pathOfJihoon[row][col] < pathOfFire[row][col] {
                    min = min > pathOfJihoon[row][col] ? pathOfJihoon[row][col] : min
                }
            }
        }
    }
    
    return min == Int.max ? "IMPOSSIBLE" : "\(min + 1)"
}

print(solution(maze: maze))

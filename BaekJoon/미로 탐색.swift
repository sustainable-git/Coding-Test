import Foundation

struct Node: Hashable {
    let row: Int
    let col: Int
}

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var matrix: [[Int]] = []

(0..<NM[0]).forEach { _ in
    let arr = readLine()!.map{ Int(String($0))! }
    matrix.append(arr)
}

func solution(matrix: [[Int]]) -> Int {
    let startNode = Node(row: 0, col: 0)
    var visitedNode: Set<Node> = [startNode]
    var queue: [Node] = [startNode]
    var distance: Dictionary<Node, Int> = [startNode:1]
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        
        let dx = [1, 0, -1, 0]
        let dy = [0, -1, 0, 1]
        (0..<4).forEach {
            if 0..<matrix.count ~= currentNode.row + dx[$0] &&
                0..<matrix[0].count ~= currentNode.col + dy[$0] &&
                matrix[currentNode.row + dx[$0]][currentNode.col + dy[$0]] == 1 {
                let newNode = Node(row: currentNode.row + dx[$0], col: currentNode.col + dy[$0])
                if visitedNode.contains(newNode) { return }
                
                visitedNode.update(with: newNode)
                queue.append(newNode)
                distance[newNode] = distance[currentNode]! + 1
            }
        }
    }

    return distance[Node(row: matrix.count - 1, col: matrix[0].count - 1)]!
}

print(solution(matrix: matrix))

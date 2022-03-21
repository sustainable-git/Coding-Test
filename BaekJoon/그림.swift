import Foundation

struct Node: Hashable {
    let row: Int
    let col: Int
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var inputArr: [[Int]] = []

(0..<nm[0]).forEach { _ in
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    inputArr.append(arr)
}

func solution(matrix: [[Int]]) -> [Int] {
    var visited: Set<Node> = []
    var queue: [Node] = []
    var paints: Int = 0
    var maximum: Int = 0
    
    for row in 0..<matrix.count {
        for col in 0..<matrix[row].count {
            guard matrix[row][col] == 1 else { continue }
            let node = Node(row: row, col: col)
            if visited.contains(node) { continue }
            
            var loops: Int = 0
            paints += 1
            visited.update(with: node)
            queue.append(node)
            while !queue.isEmpty {
                loops += 1
                let currentNode = queue.removeFirst()
                
                let x = [-1, 0, 1, 0]
                let y = [0, 1, 0, -1]
                (0..<4).forEach {
                    if 0..<matrix.count ~= currentNode.row + x[$0] &&
                        0..<matrix[row].count ~= currentNode.col + y[$0] &&
                        matrix[currentNode.row + x[$0]][currentNode.col + y[$0]] == 1 {
                        let newNode = Node(row: currentNode.row + x[$0], col: currentNode.col + y[$0])
                        if !visited.contains(newNode){
                            visited.update(with: newNode)
                            queue.append(newNode)
                        }
                    }
                }
            }
            maximum = max(maximum, loops)
        }
    }
    
    return [paints, maximum]
}

solution(matrix: inputArr).forEach {
    print($0)
}

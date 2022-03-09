import Foundation

// 빨간색으로 칠했을 때의 최솟값 => 직전이 파란색 혹은 초록색 일 때의 최솟값

let N = Int(readLine()!)!
var arr: [[Int]] = []
(1...N).forEach { _ in
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr.append(line)
}

func solution(arr: [[Int]]) -> Int {
    var matrix = arr
    
    (1...arr.count - 1).forEach { row in
        (0...matrix[0].count - 1).forEach { col in
            matrix[row][col] += matrix[row - 1].enumerated().filter{ $0.offset != col }.map{ $0.element }.min()!
        }
    }
    
    return matrix.last!.min()!
}

print(solution(arr: arr))

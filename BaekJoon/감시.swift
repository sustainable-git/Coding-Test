import Foundation

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var matrix = [[Int]]()
(0..<NM[0]).forEach { _ in
    matrix.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

func solution(matrix: [[Int]]) -> Int {
    var numberOfBlindSpots = matrix.count * matrix[0].count
    
    func dfs(row: Int, col: Int, overWatch: [[Int]]) {
        if row == matrix.count {
            numberOfBlindSpots = min(numberOfBlindSpots, numberOfBlindSpotsInMatrix(matrix: overWatch))
            return
        }
        if col == matrix[row].count {
            dfs(row: row+1, col: 0, overWatch: overWatch)
            return
        }
        let number = matrix[row][col]
        switch number {
        case 0:
            dfs(row: row, col: col+1, overWatch: overWatch)
        case 1:
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.left], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.top], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.right], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.bottom], row: row, col: col, matrix: matrix, overwatch: overWatch))
        case 2:
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.top, .bottom], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.left, .right], row: row, col: col, matrix: matrix, overwatch: overWatch))
        case 3:
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.top, .right], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.right, .bottom], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.bottom, .left], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.left, .top], row: row, col: col, matrix: matrix, overwatch: overWatch))
        case 4:
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.top, .right, .bottom], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.right, .bottom, .left], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.bottom, .left, .top], row: row, col: col, matrix: matrix, overwatch: overWatch))
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.left, .top, .right], row: row, col: col, matrix: matrix, overwatch: overWatch))
        case 5:
            dfs(row: row, col: col+1, overWatch: overWatchDirection([.left, .top, .right, .bottom], row: row, col: col, matrix: matrix, overwatch: overWatch))
        case 6:
            var newOverWatch = overWatch
            newOverWatch[row][col] = 7
            dfs(row: row, col: col+1, overWatch: newOverWatch)
        default: exit(-1)
        }
    }
    dfs(row: 0, col: 0, overWatch: Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count))

    return numberOfBlindSpots
}

enum Direction {
    case left, top, right, bottom
}

func overWatchDirection(_ directions: [Direction], row: Int, col: Int, matrix: [[Int]], overwatch: [[Int]]) -> [[Int]] {
    var newMatrix = overwatch
    newMatrix[row][col] = 7
    if directions.contains(.left) {
        for j in (0..<col).reversed() {
            if matrix[row][j] == 6 { break }
            newMatrix[row][j] = 7
        }
    }
    if directions.contains(.top) {
        for i in (0..<row).reversed() {
            if matrix[i][col] == 6 { break }
            newMatrix[i][col] = 7
        }
    }
    if directions.contains(.right) {
        for j in col..<matrix[row].count {
            if matrix[row][j] == 6 { break }
            newMatrix[row][j] = 7
        }
    }
    if directions.contains(.bottom) {
        for i in row..<matrix.count {
            if matrix[i][col] == 6 { break }
            newMatrix[i][col] = 7
        }
    }
    return newMatrix
}

func numberOfBlindSpotsInMatrix(matrix: [[Int]]) -> Int {
    return matrix.reduce(0){ $0 + $1.filter{ $0 == 0 }.count }
}

print(solution(matrix: matrix))

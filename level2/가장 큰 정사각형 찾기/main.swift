import Foundation

func solution(_ board:[[Int]]) -> Int {
    var matrix = board
    var width = board[0].count
    var height = board.count
    
    for i in 1..<height {
        for j in 1..<width {
            if matrix[i][j] == 0 { continue }       
            matrix[i][j] = [matrix[i-1][j-1], matrix[i][j-1], matrix[i-1][j]].min()! + 1
        }
    }
    let result = matrix.map{$0.max()!}.max()! 
    
    return result * result
}
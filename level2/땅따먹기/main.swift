import Foundation

func solution(_ land:[[Int]]) -> Int{
    var matrix = land
    for i in 1..<matrix.count {
        matrix[i][0] += max(matrix[i-1][1], matrix[i-1][2], matrix[i-1][3])
        matrix[i][1] += max(matrix[i-1][0], matrix[i-1][2], matrix[i-1][3])
        matrix[i][2] += max(matrix[i-1][0], matrix[i-1][1], matrix[i-1][3])
        matrix[i][3] += max(matrix[i-1][0], matrix[i-1][1], matrix[i-1][2])
    }

    return matrix[matrix.count-1].max()!
}
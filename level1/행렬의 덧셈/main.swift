func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = arr1
    for col in 0..<result.count {
        for row in 0..<result[col].count {
            result[col][row] = arr1[col][row] + arr2[col][row]
        }
    }
    return result
}

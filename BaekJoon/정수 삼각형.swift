import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []

(1...n).forEach { _ in
    let row = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr.append(row)
}

func solution(arr: [[Int]]) -> Int {
    var dp = arr
    
    for i in 1..<dp.count {
        for j in 0..<dp[i].count {
            if j == 0 {
                dp[i][j] += dp[i-1][j]
            } else if j == dp[i].count - 1 {
                dp[i][j] += dp[i-1][j - 1]
            } else {
                dp[i][j] += max(dp[i-1][j-1], dp[i-1][j])
            }
        }
    }
    
    return dp.last!.max()!
}

print(solution(arr: arr))

import Foundation

func solution(_ number:[Int]) -> Int {
    var result: Int = 0
    
    func dfs(depth: Int, head: Int, sum: Int) {
        if depth == 3 {
            if sum == 0 { result += 1 }
            return
        }
        if head < number.count {
            dfs(depth: depth + 1, head: head + 1, sum: sum + number[head])
            dfs(depth: depth, head: head + 1, sum: sum)
        }
    }
    
    dfs(depth: 0, head: 0, sum: 0)
    
    return result
}

import Foundation

let NS: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
let input: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(S: Int, arr: [Int]) -> Int {
    var count = 0
    
    func dfs(depth: Int, result: Int) {
        if depth == arr.count {
            if result == S { count += 1 }
            return
        }
        
        dfs(depth: depth + 1, result: result + arr[depth])
        dfs(depth: depth + 1, result: result)
    }
    
    dfs(depth: 0, result: 0)
    
    return S == 0 ? count - 1 : count
}

print(solution(S: NS[1], arr: input.sorted(by: <)))

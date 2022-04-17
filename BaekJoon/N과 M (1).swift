import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }

func solution(N: Int, M: Int) -> [[Int]] {
    guard N >= M else { return [] }
    let numbers = (1...N)
    var result: [[Int]] = []
    
    func dfs(visited: [Int]) {
        if visited.count == M {
            result.append(visited)
            return
        }
        
        for n in numbers {
            if visited.contains(where: { $0 == n }) {
                continue
            } else {
                let nextVisited = visited + [n]
                dfs(visited: nextVisited)
            }
        }
    }
    dfs(visited: [])
    
    return result
}

solution(N: NM[0], M: NM[1]).forEach {
    print($0.map{ String($0) }.joined(separator: " "))
}

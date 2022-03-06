import Foundation

let n = Int(readLine()!)!

var dict: Dictionary<Int, Int> = [1:1, 2:2, 3:4]

func solution(n: Int) -> Int {
    if let visited = dict[n] { return visited }
    (4...n).forEach {
        dict[$0] = dict[$0 - 1]! + dict[$0 - 2]! + dict[$0 - 3]!
    }
    
    return dict[n]!
}

(1...n).forEach { _ in
    let number = Int(readLine()!)!
    print(solution(n: number))
}

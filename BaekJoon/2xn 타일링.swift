import Foundation

let N = Int(readLine()!)!

func solution(N: Int) -> Int {
    if N == 1 { return 1 }
    if N == 2 { return 2 }
    
    var arr: [Int] = Array(repeating: 0, count: N + 1)
    arr[1] = 1
    arr[2] = 2
    
    (3...N).forEach {
        arr[$0] = (arr[$0 - 1] % 10007 + arr[$0 - 2] % 10007) % 10007
    }
    
    return arr.last!
}

print(solution(N: N))

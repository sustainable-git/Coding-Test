import Foundation

let N = Int(readLine()!)!

func solution(N: Int) -> [Int] {
    var minTime: [Int] = Array(repeating: 0, count: 1000001)
    var origin: [Int] = Array(repeating: 0, count: 1000001)
    var result: [Int] = []
    var n = N
    
    (1...N).forEach {
        minTime[$0] = minTime[$0 - 1] + 1
        origin[$0] = $0 - 1
        if $0 % 2 == 0 && minTime[$0] > minTime[$0 / 2] + 1 {
            minTime[$0] = minTime[$0 / 2] + 1
            origin[$0] = $0 / 2
        }
        if $0 % 3 == 0 && minTime[$0] > minTime[$0 / 3] + 1 {
            minTime[$0] = minTime[$0 / 3] + 1
            origin[$0] = $0 / 3
        }
    }
    
    while n > 0 {
        result.append(n)
        n = origin[n]
    }
    
    return result
}

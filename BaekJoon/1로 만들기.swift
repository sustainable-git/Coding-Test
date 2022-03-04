import Foundation

let N = Int(readLine()!)!

func solution(N: Int) -> Int {
    var minTime: [Int] = Array(repeating: 0, count: 1000001)
    minTime[0] = -1

    (1...N).forEach {
        var minValue = minTime[$0 - 1]
        if $0 % 2 == 0 { minValue = min(minTime[$0/2], minValue) }
        if $0 % 3 == 0 { minValue = min(minTime[$0/3], minValue) }
        minTime[$0] = minValue + 1
    }

    return minTime[N]
}

print(solution(N: N))

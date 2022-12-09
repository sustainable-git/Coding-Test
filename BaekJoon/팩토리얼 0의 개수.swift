import Foundation

let N = Int(readLine()!)!

func solution(N: Int) -> Int {
    guard N > 0 else { return 0 }
    return (1...N).reduce(0) {$0 + numberOfPowersOfFive(of: $1)}
}

func numberOfPowersOfFive(of number: Int) -> Int {
    return number % 5 == 0 ? numberOfPowersOfFive(of: number / 5) + 1 : 0
}

print(solution(N: N))

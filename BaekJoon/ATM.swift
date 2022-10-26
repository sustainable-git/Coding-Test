import Foundation

let _ = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map { Int(String($0))! }

func solution(p: [Int]) -> Int {
    let sortedPs = p.sorted(by: <)
    var result: [Int] = []
    var lastNumber = 0
    sortedPs.forEach {
        lastNumber += $0
        result.append(lastNumber)
    }
    return result.reduce(0, +)
}

print(solution(p: p))

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var ranges: [[Int]] = []

(0..<NM[1]).forEach { _ in
    let range = readLine()!.split(separator: " ").map{ Int(String($0))! }
    ranges.append(range)
}

var result: [Int] = [0]
for (index, value) in arr.enumerated() {
    result.append(result[index] + value)
}

func solution(range: [Int]) -> Int {
    return result[range[1]] - result[range[0]-1]
}

ranges.forEach {
    print(solution(range: $0))
}

import Foundation

let kn = readLine()!.split(separator: " ").map{ Int(String($0))! }
let k = kn[0]
let n = kn[1]
var lines: [Int] = []
(0..<k).forEach { _ in
    let line = Int(readLine()!)!
    lines.append(line)
}

func solution(n: Int, lines: [Int]) -> Int {
    var low: Int = 1
    var mid: Int
    var high: Int = lines.max()!
    
    while low <= high {
        mid = (low + high)/2
        let count: Int = lines.map{ $0/mid }.reduce(0, +)
        if count < n {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return high
}

print(solution(n: n, lines: lines))

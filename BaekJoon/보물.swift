import Foundation

_ = readLine()!
let A: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
let B: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)

guard A.count == B.count else { exit(-1) }

let result = (0..<A.count).map { A[$0] * B[$0] }.reduce(0, +)
print(result)

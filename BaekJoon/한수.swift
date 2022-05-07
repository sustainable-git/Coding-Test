import Foundation

func isHan(num: Int) -> Bool {
    guard num >= 100 else { return true }
    let numArr = String(num).map{ Int(String($0))! }
    let difference = numArr[numArr.count - 1] - numArr[numArr.count - 2]
    for index in 0..<numArr.count - 2 {
        if difference != numArr[index + 1] - numArr[index] {
            return false
        }
    }
    return true
}

func solution(N: Int) -> Int {
    var count = 0
    (1...N).forEach {
        if isHan(num: $0) {
            count += 1
        }
    }
    return count
}

let N = Int(readLine()!)!
print(solution(N: N))

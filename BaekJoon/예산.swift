import Foundation

let n = readLine()
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
let budget = Int(readLine()!)!

func solution(arr: [Int], budget: Int) -> Int {
    var low: Int = 0
    var high: Int = arr.max()!
    
    while low <= high {
        let mid = (low + high) / 2
        let totalCost = arr.reduce(0){ $0 + ($1 < mid ? $1 : mid) }
        if totalCost == budget {
            return mid
        } else if totalCost < budget {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return high
}

print(solution(arr: arr, budget: budget))

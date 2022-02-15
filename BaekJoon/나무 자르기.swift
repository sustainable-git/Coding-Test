import Foundation

let m = readLine()!.split(separator: " ").map{ Int(String($0))! }[1]
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(m: Int, arr: [Int]) -> Int {
    var low = 0
    var mid = 0
    var high = arr.max()!
    
    while low <= high {
        mid = (low + high)/2
        let sumOfTree = arr.map{ $0 - mid > 0 ? $0 - mid : 0 }.reduce(0, +)
        if sumOfTree < m {
            high = mid - 1
        } else if sumOfTree > m {
            low = mid + 1
        } else {
            return mid
        }
    }
    return high
}

print(solution(m: m, arr: arr))

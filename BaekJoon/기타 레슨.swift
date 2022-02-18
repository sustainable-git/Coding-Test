import Foundation

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(N: Int, M: Int, arr: [Int]) -> Int {
    var low = 0
    var high = N * 10000
    
    while low <= high {
        let mid = (low + high)/2
        if isPossible(size: mid, limitCount: M, arr: arr) {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return low
}

func isPossible(size: Int, limitCount: Int, arr: [Int]) -> Bool {
    var index = 0
    var sum = 0
    var count = 0
    while index < arr.count {
        defer { index += 1 }
        let value = arr[index]
        guard value <= size else { return false }
        if sum + value <= size {
            sum += value
        } else {
            sum = value
            count += 1
        }
    }
    if sum > 0 { count += 1 }
    
    return count <= limitCount ? true : false
}

print(solution(N: NM[0], M: NM[1], arr: arr))

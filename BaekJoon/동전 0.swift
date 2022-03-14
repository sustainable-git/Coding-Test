import Foundation

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr: [Int] = []

(1...NK[0]).forEach { _ in
    arr.append(Int(readLine()!)!)
}

func solution(arr: [Int], K: Int) -> Int {
    var left = K
    var count = 0
    var index = arr.count - 1
    
    while left > 0 {
        let currentCoin = arr[index]
        if left >= currentCoin {
            left -= currentCoin
            count += 1
        } else {
            index -= 1
        }
    }
    
    return count
}

print(solution(arr: arr, K: NK[1]))

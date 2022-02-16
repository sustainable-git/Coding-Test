import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(X: Int, Y: Int) -> Int {
    let winRate = Y*100/X
    guard winRate < 99 else { return -1 }

    var low: Int = 0
    var high: Int = 1000000000
    while low <= high {
        let mid = (low + high)/2
        let newWinRate = (Y+mid)*100/(X+mid)
        if newWinRate <= winRate {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }

    return low
}

print(solution(X: input[0], Y: input[1]))


import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()

(0..<N).forEach { _ in
    let meeting = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(meeting)
}

func solution(arr: [[Int]]) -> Int {
    let sortedArr = arr.sorted {
        if $0[0] < $1[0] {
            return true
        } else if $0[0] == $1[0] {
            return $0[1] < $1[1]
        } else {
            return false
        }
    }
    
    var count = 0
    var index = 1
    var lastMeeting = sortedArr.first!
    
    while index < sortedArr.count {
        defer { index += 1 }
        let currentMeeting = sortedArr[index]
        if currentMeeting[1] < lastMeeting[1] {
            lastMeeting = currentMeeting
        } else if lastMeeting[1] <= currentMeeting[0] {
            count += 1
            lastMeeting = currentMeeting
        }
    }
    
    return count + 1
}

print(solution(arr: arr))

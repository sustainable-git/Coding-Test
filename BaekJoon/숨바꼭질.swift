import Foundation

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }

func solution(N: Int, K: Int) -> Int {
    var queue: [Int] = [N]
    var index = 0
    var minTimes: [Int?] = Array(repeating: nil, count: 100001)
    minTimes[N] = 0
    
    while queue.count > index {
        defer{ index += 1 }
        let currentLocation = queue[index]
        
        let lowerPosition = currentLocation - 1
        let upperPosition = currentLocation + 1
        let doubledPosition = currentLocation * 2
        
        if 0...100000 ~= lowerPosition {
            if minTimes[lowerPosition] == nil {
                minTimes[lowerPosition] = minTimes[currentLocation]! + 1
                queue.append(lowerPosition)
            }
        }
        
        if 0...100000 ~= upperPosition {
            if minTimes[upperPosition] == nil {
                minTimes[upperPosition] = minTimes[currentLocation]! + 1
                queue.append(upperPosition)
            }
        }
        
        if 0...100000 ~= doubledPosition {
            if minTimes[doubledPosition] == nil {
                minTimes[doubledPosition] = minTimes[currentLocation]! + 1
                queue.append(doubledPosition)
            }
        }
        
        if let result = minTimes[K] {
            return result
        }
    }
    
    return -1
}

print(solution(N: NK[0], K: NK[1]))

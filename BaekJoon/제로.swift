import Foundation

let K = Int(readLine()!)!
var input = [Int]()

(1...K).forEach { _ in
    input += [(Int(readLine()!)!)]
}

func solution(input: [Int]) -> Int {
    var queue: [Int] = []
    
    for number in input {
        if number == 0 {
            queue.removeLast()
        } else {
            queue.append(number)
        }
    }
    
    return queue.reduce(0, +)
}

print(solution(input: input))

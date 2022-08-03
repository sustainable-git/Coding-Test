import Foundation

let N = Int(readLine()!)!
var arr: [(Int, Int)] = []
(0..<N).forEach { _ in
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

func solution(arr: [(Int, Int)]) -> [Int] {
    return arr.map {
        var count = 1
        for element in arr {
            if element.0 > $0.0 && element.1 > $0.1 {
                count += 1
            }
        }
        return count
    }
}

solution(arr: arr).forEach {
    print($0, terminator: " ")
}

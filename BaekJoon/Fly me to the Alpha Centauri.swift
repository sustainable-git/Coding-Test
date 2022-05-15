import Foundation

let T = Int(readLine()!)!
var inputArr: [(from: Int, to: Int)] = []
(0..<T).forEach { _ in
    let element = readLine()!.split(separator: " ").map{ Int(String($0))! }
    guard element.count == 2 else { exit(-1) }
    inputArr.append((element[0], element[1]))
}

func minimumMoves(from start: Int, to end: Int) -> Int {
    let difference = end - start
    var result = 1
    
    while true {
        if rangeOfMinumumDistance(result).contains(difference) {
            break
        } else {
            result += 1
        }
    }
    
    return result
}

func rangeOfMinumumDistance(_ distance: Int) -> Range<Int> {
    let start: Int = arithmeticSequence(to: (distance - 1) / 2) + arithmeticSequence(to: distance / 2)
    let end: Int = arithmeticSequence(to: distance / 2) + arithmeticSequence(to: (distance + 1) / 2)
    
    return Range((start + 1)...end)
}

func arithmeticSequence(to: Int) -> Int {
    return to * (to + 1) / 2
}

inputArr.forEach { from, to in
    print(minimumMoves(from: from, to: to))
}

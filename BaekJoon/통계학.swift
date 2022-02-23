import Foundation

let N = Int(readLine()!)!
var arr: [Int] = []
(1...N).forEach { _ in
    let number = Int(readLine()!)!
    arr.append(number)
}

func solution(arr: [Int]) -> [Int] {
    let sortedArr = arr.sorted()
    
    let arithmeticMean = Int((arr.reduce(0) { $0 + Double($1) }/Double(arr.count)).rounded())
    let middleValue = sortedArr[arr.count/2]
    let mode: Int
    let range = sortedArr.last! - sortedArr.first!
    
    var numberDict: Dictionary<Int, Int> = [:]
    arr.forEach { numberDict[$0, default: 0] += 1 }
    let maxValue = numberDict.max{ $0.value < $1.value }!.value
    let filtered = numberDict.filter{ $0.value == maxValue }.map{ $0.key }.sorted()
    if filtered.count == 1 {
        mode = filtered.first!
    } else {
        mode = filtered[1]
    }
    
    return [arithmeticMean, middleValue, mode, range]
}

solution(arr: arr).forEach {
    print($0)
}

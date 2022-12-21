import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    let hailstoneSequence: [Int] = hailstoneNumber(of: k)
    return ranges.map { range in
        let startIndex = range[0]
        let distanceFromEndIndex = range[1]
        let endIndex = hailstoneSequence.count - 1 + distanceFromEndIndex
        return endIndex >= startIndex ? definiteIntegral(in: hailstoneSequence, fromIndex: startIndex, toIndex: endIndex) : -1
    }
}

func hailstoneNumber(of number: Int) -> [Int] {
    var hailstoneSequence: [Int] = [number]
    while let lastNumberOfSequence = hailstoneSequence.last, lastNumberOfSequence != 1 {
        lastNumberOfSequence % 2 == 0 ?
        hailstoneSequence.append(lastNumberOfSequence / 2) : hailstoneSequence.append(lastNumberOfSequence * 3 + 1)
    }
    return hailstoneSequence
}

func definiteIntegral(in array: [Int], fromIndex startIndex: Int, toIndex endIndex: Int) -> Double {
    guard startIndex <= endIndex else { fatalError() }
    return Double(array[startIndex...endIndex].reduce(0) { $0 + $1 }) - Double(array[startIndex] + array[endIndex]) / Double(2)
}

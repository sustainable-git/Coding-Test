import Foundation

func solution(_ elements:[Int]) -> Int {
    var sumsOfConsecutiveSubsequences: Set<Int> = []
    
    let doubledElements = elements + elements
    for startIndex in 0..<elements.count {
        var sum: Int = 0
        for index in startIndex..<elements.count + startIndex {
            sum += doubledElements[index]
            sumsOfConsecutiveSubsequences.update(with: sum)
        }
    }
    
    return sumsOfConsecutiveSubsequences.count
}

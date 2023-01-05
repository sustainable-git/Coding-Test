import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var numberOfPairs = 0
    
    let startPoints = A.enumerated().map { $0.offset - $0.element }.sorted(by: <)
    let endPoints = A.enumerated().map { $0.offset + $0.element }.sorted(by: <)
    var endPointHead = 0
    var currentNumberOfDisks = 0
    
    for element in startPoints {
        while endPointHead < endPoints.count, endPoints[endPointHead] < element {
            endPointHead += 1
            currentNumberOfDisks -= 1
        }
        numberOfPairs += currentNumberOfDisks
        currentNumberOfDisks += 1
    }
    
    return numberOfPairs > 10000000 ? -1 : numberOfPairs
}

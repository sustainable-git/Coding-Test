import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var totalSum = A.reduce(0, +)
    var minABS: Int = Int.max
    for element in A[..<(A.count - 1)] {
        totalSum -= element * 2
        minABS = min(abs(totalSum), minABS)
    }
    return minABS
}

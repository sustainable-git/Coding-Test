import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var minStartPoint: Int = 0
    var minAverage: Double = 100000
    
    for index in 0..<A.count - 1 {
        if Double(A[index] + A[index + 1]) / 2.0 < minAverage {
            minStartPoint = index
            minAverage = Double(A[index] + A[index + 1]) / 2.0
        }
        if index + 2 < A.count, Double(A[index] + A[index + 1] + A[index + 2]) / 3.0 < minAverage {
            minStartPoint = index
            minAverage = Double(A[index] + A[index + 1] + A[index + 2]) / 3.0
        }
    }
    
    return minStartPoint
}

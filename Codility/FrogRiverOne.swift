import Foundation
import Glibc

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    var positionsOfLeaves: Set<Int> = Set<Int>((1...X))
    for (fallingTime, positionOfLeave) in A.enumerated() {
        positionsOfLeaves.remove(positionOfLeave)
        if positionsOfLeaves.isEmpty {
            return fallingTime
        }
    }
    return -1
}

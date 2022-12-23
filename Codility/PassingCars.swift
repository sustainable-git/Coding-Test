import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var numberOfPairs: Int = 0
    var numberOfZeros: Int = 0
    for car in A {
        if car == 0 {
            numberOfZeros += 1
        } else {
            numberOfPairs += numberOfZeros
        }
    }
    return numberOfPairs > 1000000000 ? -1 : numberOfPairs
}

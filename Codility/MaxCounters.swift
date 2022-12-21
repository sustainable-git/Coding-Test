import Foundation
import Glibc

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var maxValue: Int = 0
    var savedMaxValue: Int = 0
    var counters: [Int] = Array(repeating: 0, count: N)
    for operation in A {
        if operation > N {
            savedMaxValue = maxValue
        } else {
            counters[operation - 1] = max(savedMaxValue, counters[operation - 1]) + 1
            maxValue = max(counters[operation - 1], maxValue)
        }
    }

    return counters.map { $0 >= savedMaxValue ? $0 : savedMaxValue }
}

import Glibc
import Foundation

public func solution(_ N : Int) -> Int {
    let binary: String = String(N, radix: 2)
    var maxBinaryGap: Int = 0
    var currentBinaryGap: Int = 0
    for element in binary {
        if element == "1" {
            maxBinaryGap = max(maxBinaryGap, currentBinaryGap)
            currentBinaryGap = 0
        } else {
            currentBinaryGap += 1
        }
    }
    return maxBinaryGap
}

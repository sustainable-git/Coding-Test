import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var integerCollection: Set<Int> = Set((1...A.count))
    for number in A {
        integerCollection.remove(number)
    }
    return integerCollection.isEmpty ? 1 : 0
}

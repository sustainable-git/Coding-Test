import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    return A.reduce(0) { $0 ^ $1 }
}

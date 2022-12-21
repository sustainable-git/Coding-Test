import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    return (1...A.count+1).reduce(0, +) - A.reduce(0, +)
}

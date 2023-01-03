import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let arr = A.sorted(by: >)
    return max(arr[0..<3].reduce(1, *), arr[0] * arr[arr.count - 2] * arr[arr.count-1])
}

import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count >= 3 else { return 0 }
    let arr = A.sorted(by: <)
    for i in 0..<arr.count - 2 {
        if arr[i+2] < arr[i+1] + arr[i] {
            return 1
        }
    }
    return 0
}     

import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let set = Set(A.filter{ $0 > 0 })
    for integer in 1...1000000 {
        if !set.contains(integer) {
            return integer
        }
    }
    return 0
}

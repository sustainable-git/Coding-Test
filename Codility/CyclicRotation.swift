import Foundation
import Glibc

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    (0..<K).forEach { _ in
        A.insert(A.removeLast(), at: 0)
    }
    return A
}

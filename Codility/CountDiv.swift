import Foundation
import Glibc

public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
    return A % K == 0 ? B/K - A/K + 1 : B/K - A/K
}

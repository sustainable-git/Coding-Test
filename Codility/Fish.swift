import Foundation
import Glibc

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    var upstreamStack: [Int] = []
    var downstreamStack: [Int] = []
    
    zip(A, B).forEach { value in
        let fishSize = value.0
        let direction = value.1
        
        switch direction {
        case 0:
            while let downstreamFishSize = downstreamStack.last {
                if downstreamFishSize < fishSize { _ = downstreamStack.removeLast() }
                else { break }
            }
            if downstreamStack.isEmpty { upstreamStack.append(fishSize) }
        case 1:
            downstreamStack.append(fishSize)
        default: exit(-1)
        }
    }
    
    return upstreamStack.count + downstreamStack.count
}

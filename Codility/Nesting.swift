import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    var stack: [Character] = []
    
    for element in S {
        switch element {
        case "(":
            stack.append(element)
        case ")":
            guard let top = stack.last else { return 0 }
            top == "(" ? _ = stack.removeLast() : stack.append(element)
        default :
            fatalError()
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

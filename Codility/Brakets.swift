import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    var brakets: [Character] = []
    let closingBrakets: Set<Character> = [")", "}", "]"]
    let braketDictionary: Dictionary<Character, Character> = [")": "(", "}": "{", "]": "["]

    for element in S {
        if closingBrakets.contains(element) {
            if let pair = braketDictionary[element], brakets.last == pair  {
                brakets.removeLast()
            } else {
                return 0
            }
        } else {
            brakets.append(element)
        }
    }

    return brakets.isEmpty ? 1 : 0
}

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var cellPhoneKeyMap = CellPhoneKeyMap()
    keymap.forEach {
        cellPhoneKeyMap.register(Words: $0)
    }
    
    return targets.map { cellPhoneKeyMap.minimumTouchesFor(words: $0) }
}

struct CellPhoneKeyMap {
    private var minimumTouchesForKey: [String: Int] = [:]
    
    mutating func register(Words: String) {
        Words.enumerated().forEach { (index, value) in
            let word = String(value)
            let numberOfTouches = index + 1
            if let minimumTouchesBefore = minimumTouchesForKey[word] {
                minimumTouchesForKey[word] = min(minimumTouchesBefore, numberOfTouches)
            } else {
                minimumTouchesForKey[word] = numberOfTouches
            }
        }
    }
    
    func minimumTouchesFor(words: String) -> Int {
        var count = 0
        
        for word in words.map({ String($0) }) {
            if let touches = minimumTouchesForKey[word] {
                count += touches
            } else {
                return -1
            }
        }
        
        return count
    }
}

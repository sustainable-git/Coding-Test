import Foundation

let N = Int(readLine()!)!
var result = 0

func isGroupedWord(_ word: String) -> Bool {
    let wordMap = word.map{ String($0) }
    var dictionary: Dictionary<String, Bool> = [wordMap[0]: true]
    var rightBefore: String = wordMap[0]
    
    for character in wordMap {
        if character != rightBefore {
            rightBefore = character
            if dictionary[rightBefore] == nil {
                dictionary.updateValue(true, forKey: character)
            } else {
                return false
            }
        }
    }
    return true
}

(0..<N).forEach { _ in
    isGroupedWord(readLine()!) ? result += 1 : Void()
}
print(result)

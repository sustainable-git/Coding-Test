import Foundation

func solution(_ s:String) -> [Int] {
    var characterDictionary: Dictionary<Character, Int> = [:]
    var result: [Int] = []
    
    s.enumerated().forEach { (index, char) in
        if let previousCharacterIndex = characterDictionary[char] {
            result += [index - previousCharacterIndex]
            characterDictionary[char] = index
        } else {
            result += [-1]
            characterDictionary.updateValue(index, forKey: char)
        }
    }
    
    return result
}

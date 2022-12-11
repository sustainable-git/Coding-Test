import Foundation

func solution(_ s:String) -> Int {
    var characters: Dictionary<Character, Int> = [:]
    var numberOfSplitedStrings = 0
    var selectedCharacter: Character? = nil
    
    s.forEach { char in
        if selectedCharacter == nil {
            selectedCharacter = char
        }
        characters[char, default: 0] += 1
        if isSameNumberOfCharacters(in: characters, about: selectedCharacter!) {
            selectedCharacter = nil
            characters.removeAll()
            numberOfSplitedStrings += 1
        }
    }
    
    return characters.isEmpty ? numberOfSplitedStrings : numberOfSplitedStrings + 1
}

func isSameNumberOfCharacters(in dictionary: Dictionary<Character, Int>, about character: Character) -> Bool {
    guard let numberOfSelectedCharacters = dictionary[character] else { return false }
    return dictionary.reduce(0){$0 + $1.value} == numberOfSelectedCharacters * 2
}

import Foundation

func solution(_ babbling:[String]) -> Int {
    let pronounceableElements: Set<String> = ["aya", "ye", "woo", "ma"]
    var numberOfPronounceableWords: Int = 0
    
    babbling.forEach { word in
        guard !word.isEmpty else { fatalError() }
        var spokenWord = ""
        var speakingWord = ""
        for element in word {
            guard speakingWord.count < 3 else { break }
            speakingWord += String(element)
            if pronounceableElements.contains(speakingWord) && spokenWord != speakingWord {
                spokenWord = speakingWord
                speakingWord.removeAll()
            }
        }
        speakingWord.isEmpty ? numberOfPronounceableWords += 1 : Void()
    }
    
    return numberOfPronounceableWords
}

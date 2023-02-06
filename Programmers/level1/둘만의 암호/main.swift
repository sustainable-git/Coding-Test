import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let wordsToSkip = Set(skip)
    return s.reduce(""){ $0 + String(change($1, sizeToSkip: index, wordsToSkip: wordsToSkip)) }
}

func change(_ character: Character, sizeToSkip: Int, wordsToSkip: Set<Character>) -> Character {
    if sizeToSkip == 0 { return character }

    let alphabet: String = "abcdefghijklmnopqrstuvwxyz"
    let index: String.Index = alphabet.firstIndex(of: character)!
    let nextIndex: String.Index = alphabet.circularIndex(after: index)
    return wordsToSkip.contains(alphabet[nextIndex]) ?
    change(alphabet[nextIndex], sizeToSkip: sizeToSkip, wordsToSkip: wordsToSkip) :
    change(alphabet[nextIndex], sizeToSkip: sizeToSkip - 1, wordsToSkip: wordsToSkip)
}

extension String {
    func circularIndex(after index: String.Index) -> String.Index {
        return index == self.index(before: endIndex) ? self.startIndex : self.index(after: index)
    }
}

import Foundation

let word = readLine()!

func solution(word: String) -> Int {
    var count = word.count
    var twoTimesBefore: String? = nil
    var justBefore: String? = nil
    let wordMap = word.map{ String($0) }
    
    for index in 0..<wordMap.count {
        let currentWord = wordMap[index]
        switch currentWord {
        case "=":
            guard let justBefore = justBefore else { break }
            switch justBefore {
            case "c": count -= 1
            case "z":
                if let twoTimesBefore = twoTimesBefore {
                    twoTimesBefore == "d" ? count -= 1 : Void()
                }
                count -= 1
            case "s": count -= 1
            default: exit(-1)
            }
        case "-":
            guard let justBefore = justBefore else { break }
            if justBefore == "c" || justBefore == "d" {
                count -= 1
            } else {
                exit(-2)
            }
        case "j":
            guard let justBefore = justBefore else { break }
            if justBefore == "l" || justBefore == "n" {
                count -= 1
            }
        default:
            Void()
        }
        twoTimesBefore = justBefore
        justBefore = currentWord
    }
    
    return count
}

print(solution(word: word))

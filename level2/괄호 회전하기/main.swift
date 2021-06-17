import Foundation

func nextString(_ s : inout String) -> Void {
    let lastCharacter = s.removeFirst()
    s = s + String(lastCharacter)
}

func isGoodBracket(_ s : String) -> Bool {
    var arr = [String]()
    for i in s {
        switch arr.last {
            case "(" :
                if String(i) == ")" { arr.removeLast() } else { arr.append(String(i)) }; break
            case "{" :
                if String(i) == "}" { arr.removeLast() } else { arr.append(String(i)) }; break
            case "[" :
                if String(i) == "]" { arr.removeLast() } else { arr.append(String(i)) }; break
            default : arr.append(String(i)); break
        }
    }
    return arr.count == 0 ? true : false
}

func solution(_ s:String) -> Int {
    var sCopy = s
    var count = 0

    for _ in 0..<s.count {
        if isGoodBracket(sCopy) { count += 1 }
        nextString(&sCopy)
    }

    return count
}

import Foundation

func head(_ str : String) -> String {
    var result = ""

    for i in str {
        if i.isLetter || ["-", ".", " "].contains(i) { result += String(i) }
        else { return result}
    }
    return result
}

func number(_ str : String) -> String {
    var numStr = str
    for _ in 0..<head(str).count { numStr.removeFirst() }
    var result = ""

    for i in numStr {
        if i.isNumber { result += String(i) }
        else { return result }
    }
    return result
}

func solution(_ files:[String]) -> [String] {
    return files.sorted{
        if head($0.lowercased()) < head($1.lowercased()) { return true }
        else if head($0.lowercased()) == head($1.lowercased()) {
            if Int(number($0))! < Int(number($1))! { return true }
            else { return false }
        }
        else { return false }
    }
}

import Foundation

let S = readLine()!

func solution(S: String) -> String {
    var isInBracket: Bool = false
    var slicedStrings: [String] = []
    var tempString: String = ""
    
    for element in S {
        if isInBracket {
            guard element != "<" else { exit(-1) }
            tempString += String(element)
            if element == ">" {
                isInBracket = false
                slicedStrings.append(tempString)
                tempString.removeAll()
            }
        } else {
            guard element != ">" else { exit(-1) }
            if element == "<" {
                isInBracket = true
                slicedStrings.append(tempString)
                tempString.removeAll()
            }
            if element == " " {
                slicedStrings.append(tempString)
                tempString.removeAll()
            } else {
                tempString += String(element)
            }
        }
    }
    slicedStrings.append(tempString)
    
    slicedStrings = slicedStrings.filter{ $0 != "" }.map {
        if $0.contains("<") && $0.contains(">") {
            return $0
        } else {
            return String($0.reversed())
        }
    }
    
    let resultString = slicedStrings.reduce("") {
        if $0.last == ">" && $1.first == "<" {
            return $0 + $1
        } else if $0.last == ">" {
            return $0 + $1
        } else if $1.first == "<" {
            return $0 + $1
        } else {
            return $0 + " " + $1
        }
    }
    if resultString.first == " " {
        return String(resultString.dropFirst())
    } else {
        return resultString
    }
}

print(solution(S: S))

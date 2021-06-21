import Foundation

func validCheck(_ str : String) -> Bool {
    var arr = [Character]()

    for i in str {
        if arr.last == "(" && i == ")" { arr.removeLast() } 
        else { arr.append(i) }
    }

    return arr.count == 0 ? true : false
}

func separator(_ str : String) -> (String, String) {
    var u : String = ""
    var v : String = ""
    var `switch` : Bool = true

    for i in str {
        if `switch` { u += String(i)
            if u.filter{$0 == "("}.count == u.filter{$0 == ")"}.count { `switch` = false }
        } else { v += String(i) }
    }

    return (u, v)
}

func loop(_ str : String) -> String {
    if str.count == 0 { return ""}

    var u : String = ""
    var v : String = ""

    (u, v) = separator(str)
    if validCheck(u) { // 올바른 괄호 문자열이면
        return u + loop(v)
    } else { // 올바른 괄호 문자열이 아니면
        var leftone = "(" + loop(v) + ")" ; var rightone = ""
        u.removeFirst() ; u.removeLast()
        u.forEach{ if $0 == "(" {rightone.append(")")} else {rightone.append("(")} }
        return leftone + rightone
    }
}

func solution(_ p:String) -> String {
    if validCheck(p) == true { return p }
    else { return loop(p) }
}

func solution2(_ p:String) -> String {
    if p.count == 0 { return "" }
    
    var index = p.startIndex; var count = 0
    repeat {
        count += p[index] == "(" ? 1 : -1
        index = p.index(after: index)
    } while count != 0
    
    var u = String(p[..<index]); var v = String(p[index...])
    if u.first == "(" {
        return u + solution(v)
    } else {
        u.removeFirst(); u.removeLast();
        return "(" + solution(v) + ")" + u.map{$0 == "(" ? ")" : "("}.joined()
    }
}
import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id
    
    id = id.lowercased() // 1
    let specialCharacterSet = [".", "-", "_", "."]
    id = id.filter{$0.isLetter || $0.isNumber || specialCharacterSet.contains(String($0))} // 2
    while (strstr(id, "..") != nil) { id = id.replacingOccurrences(of: "..", with: ".") } // 3
    while id.last == "." || id.first == "." { id = id.trimmingCharacters(in: ["."]) } // 4
    if id.count == 0 { id.append("a") } // 5
    while id.count >= 16 { id.removeLast(); id = id.trimmingCharacters(in: ["."]) } // 6
    while id.count <= 2 { id.append(id.last!) } // 7
    
    return id
}

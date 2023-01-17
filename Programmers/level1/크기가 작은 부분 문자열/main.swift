import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let length = p.count
    let tMap = t.map { $0 }
    var count = 0
    
    for index in 0...t.count - length {
        count += tMap[index..<index + length].reduce("") { $0 + String($1) } <= p ? 1 : 0
    }
    
    return count
}

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var yearningDictionary: [String: Int] = [:]
    zip(name, yearning).forEach {
        yearningDictionary[$0] = $1
    }
    
    return photo.map { $0.reduce(0) { $0 + (yearningDictionary[$1] ?? 0) } }
}

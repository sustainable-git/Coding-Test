import Foundation

func solution23(_ clothes:[[String]]) -> Int {
    var clothesByType: [String:[String]] = [:]
    
    clothes.forEach {
        clothesByType[$0[1], default: []].append($0[0])
    }
    
    return clothesByType.map{ $0.value.count + 1 }.reduce(1, *) - 1
}

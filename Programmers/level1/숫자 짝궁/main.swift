import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var dictionaryOfX: [Character: Int] = [:]
    var dictionaryOfY: [Character: Int] = [:]
    X.forEach { dictionaryOfX[$0, default: 0] += 1 }
    Y.forEach { dictionaryOfY[$0, default: 0] += 1 }
    
    var innerSetString: String = ""
    dictionaryOfX.forEach { (key, numberOfCommonNumbersOfX) in
        guard let numberOfCommonNumbersOfY = dictionaryOfY[key] else { return }
        innerSetString += String(repeating: key, count: min(numberOfCommonNumbersOfX, numberOfCommonNumbersOfY))
    }
    
    let result = innerSetString.count > 0 ? String(innerSetString.sorted(by: >)) : "-1"
    return result.first == "0" ? "0" : result
}

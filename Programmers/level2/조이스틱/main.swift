import Foundation

func solution(_ name:String) -> Int {
    var nCopyArr = name.map{String($0)}
    var upDownCount = 0
    var leftRightCount = name.count - 1 // right now, it is the biggest
    
    var dictionary = [String : Int]()
    for i in 65..<91 { // dictionary initializer
        let value = i - 65
        dictionary[String(UnicodeScalar(UInt8(i)))] = value < 26 - value ? value : 26 - value
    }
    for alphabet in nCopyArr { upDownCount += dictionary[alphabet]! } // upDownCount initializer
    
    for index in 0..<name.count { // to check if we can get better option at each indexs
        var isAIndex = index + 1
        while isAIndex < name.count && nCopyArr[isAIndex] == "A" { isAIndex += 1 }
        let leftRightMoves = 2 * index + name.count - isAIndex
        
        leftRightCount = min(leftRightCount, leftRightMoves)
    }
    
    return upDownCount + leftRightCount
}

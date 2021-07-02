import Foundation

func solution(_ msg : String) -> [Int] {
    let msgArr = msg.map{String($0)}
    var dictionary = [String : Int]()
    var resultArr = [Int]()
    var head = 0
    var str = ""
    var nextIndex = 27
    
    for i in 1...26 { // make first dictionary
        dictionary[String(UnicodeScalar(64 + i)!)] = i
    }
    
    while head < msg.count {
        str += msgArr[head]
        while dictionary[str] != nil && head < msg.count - 1 {
            head += 1
            str += msgArr[head]
        }
        if dictionary[str] == nil {
            dictionary[str] = nextIndex
            nextIndex += 1
            head -= 1
            str.removeLast()
        }
        resultArr.append(dictionary[str]!)
        head += 1
        str = ""
    }
    
    return resultArr
}

import Foundation

func solution(_ s:String) -> String {
    let strArr = s.components(separatedBy: " ").map{String($0)}
    var resultStr = ""
    for eachString in strArr {
        for (index, value) in eachString.enumerated() {
            if index == 0 { resultStr.append(value.uppercased()) }
            else { resultStr.append(value.lowercased()) }
        }
        resultStr += " "
    }
    resultStr.popLast()

    return resultStr
}

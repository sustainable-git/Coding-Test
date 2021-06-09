import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var resultArr = [Int]()
    var resultString = [String]()
    var resultMap = [String]()

    for i in 0..<n { resultArr.append(arr1[i] | arr2[i]) }
    for i in resultArr {
        var string = String(i, radix: 2)
        while string.count < n {
            string = "0"+string
        }
        resultString.append(string)
    }
    for i in resultString { resultMap.append(i.replacingOccurrences(of: "1", with: "#").replacingOccurrences(of: "0", with: " ")) }

    return resultMap
}

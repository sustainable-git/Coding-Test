import Foundation

/*
 * Complete the 'balancedSums' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func balancedSums(arr: [Int]) -> String {
    guard arr.count > 1 else { return "YES" }
    
    var index = 0
    var left = 0
    var right = arr.reduce(0, +) - arr.first!
    while index < arr.count - 1 {
        defer {
            left += arr[index]
            right -= arr[index+1]
            index += 1
        }
        if left == right { return "YES" }
        else if left > right { return "NO" }
    }
    
    return "NO"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let T = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for TItr in 1...T {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arr: [Int] = arrTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arr.count == n else { fatalError("Bad input") }

    let result = balancedSums(arr: arr)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

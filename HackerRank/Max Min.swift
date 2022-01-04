import Foundation

/*
 * Complete the 'maxMin' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER k
 *  2. INTEGER_ARRAY arr
 */

func maxMin(k: Int, arr: [Int]) -> Int {
    let sortedArr: [Int] = arr.sorted(by: <)
    var result: Int = sortedArr.last! - sortedArr.first!
    for startIndex in 0...sortedArr.count-k {
        let subArray = sortedArr[startIndex..<startIndex+k]
        let unfairness = subArray.last! - subArray.first!
        result = min(result, unfairness)
    }

    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let k = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var arr = [Int]()

for _ in 1...n {
    guard let arrItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    arr.append(arrItem)
}

guard arr.count == n else { fatalError("Bad input") }

let result = maxMin(k: k, arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

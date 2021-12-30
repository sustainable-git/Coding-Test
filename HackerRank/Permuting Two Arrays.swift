import Foundation

/*
 * Complete the 'twoArrays' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts following parameters:
 *  1. INTEGER k
 *  2. INTEGER_ARRAY A
 *  3. INTEGER_ARRAY B
 */

func twoArrays(k: Int, A: [Int], B: [Int]) -> String {
    let sortedA = A.sorted(by: <)
    let sortedB = B.sorted(by: >)
    
    for index in 0..<A.count {
        if sortedA[index] + sortedB[index] >= k {
            continue
        } else {
            return "NO"
        }
    }
    return "YES"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
    let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

    guard let n = Int(firstMultipleInput[0])
    else { fatalError("Bad input") }

    guard let k = Int(firstMultipleInput[1])
    else { fatalError("Bad input") }

    guard let ATemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let A: [Int] = ATemp.split(separator: " ").map {
        if let AItem = Int($0) {
            return AItem
        } else { fatalError("Bad input") }
    }

    guard A.count == n else { fatalError("Bad input") }

    guard let BTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let B: [Int] = BTemp.split(separator: " ").map {
        if let BItem = Int($0) {
            return BItem
        } else { fatalError("Bad input") }
    }

    guard B.count == n else { fatalError("Bad input") }

    let result = twoArrays(k: k, A: A, B: B)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

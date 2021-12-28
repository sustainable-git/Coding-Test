import Foundation

/*
 * Complete the 'flippingBits' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts LONG_INTEGER n as parameter.
 */

func flippingBits(n: Int) -> Int {
    let int32Max = 1<<32 - 1
    return int32Max - n
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let result = flippingBits(n: n)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

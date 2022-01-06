import Foundation

/*
 * Complete the 'counterGame' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts LONG_INTEGER n as parameter.
 */

func counterGame(n: Int) -> String {
    var count = 0
    var number = n
    while number != 1 {
        defer { count += 1 }
        let closestPowerOfTwo: Int = 1<<Int((flsl(number) - 1))
        if number == closestPowerOfTwo {
            number /= 2
        } else {
            number -= closestPowerOfTwo
        }
    }

    return count % 2 == 0 ? "Richard" : "Louise"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let result = counterGame(n: n)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

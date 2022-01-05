import Foundation

/*
 * Complete the 'superDigit' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. STRING n
 *  2. INTEGER k
 */

func superDigit(n: String, k: Int) -> Int {
    var string = n
    while string.count > 1 {
        string = superDigit(n: string)
    }
    
    string = String(Int(string)! * k)
    while string.count > 1 {
        string = superDigit(n: string)
    }
    
    return Int(string)!
}

func superDigit(n: String) -> String {
    let string = n.reduce(0){$0 + Int(String($1))!}
    return String(string)
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

let n = firstMultipleInput[0]

guard let k = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

let result = superDigit(n: n, k: k)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

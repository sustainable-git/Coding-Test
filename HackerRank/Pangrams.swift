import Foundation

/*
 * Complete the 'pangrams' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func pangrams(s: String) -> String {
    let alphabet: String = "abcdefghijklmnopqrstuvwxyz"
    let pattern: String = alphabet.reduce(""){ $0 + "(?=.*" + String($1) + ")" }
    
    return isMatched(s.lowercased(), pattern: pattern) == true ? "pangram" : "not pangram"
}

func isMatched(_ string: String, pattern: String) -> Bool {
    let regex = try? NSRegularExpression(pattern: pattern)
    return regex?.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) != nil
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = pangrams(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

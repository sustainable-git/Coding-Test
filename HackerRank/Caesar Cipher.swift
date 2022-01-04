import Foundation

/*
 * Complete the 'caesarCipher' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. INTEGER k
 */

func caesarCipher(s: String, k: Int) -> String {
    let lowerCasedAlphabets: [String] = "abcdefghijklmnopqrstuvwxyz".map{ String($0) }
    let upperCasedAlphabets: [String] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{ String($0) }
    var result: String = ""
    
    for char in s.map({ String($0) }) {
        if let index = lowerCasedAlphabets.firstIndex(of: char) {
            let shiftedIndex = (index + k) % lowerCasedAlphabets.count
            result += lowerCasedAlphabets[shiftedIndex]
        } else if let index = upperCasedAlphabets.firstIndex(of: char) {
            let shiftedIndex = (index + k) % upperCasedAlphabets.count
            result += upperCasedAlphabets[shiftedIndex]
        } else {
            result += char
        }
    }
    
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let s = readLine() else { fatalError("Bad input") }

guard let k = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = caesarCipher(s: s, k: k)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

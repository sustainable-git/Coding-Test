import Foundation

/*
 * Complete the 'gridChallenge' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING_ARRAY grid as parameter.
 */

func gridChallenge(grid: [String]) -> String {
    let rowSortedGrid = grid.map{ $0.sorted() }
    for index in 0..<rowSortedGrid.count {
        if rowSortedGrid.map({ $0[index] }) != rowSortedGrid.map({ $0[index] }).sorted() {
            return "NO"
        }
    }
    return "YES"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    var grid = [String]()

    for _ in 1...n {
        guard let gridItem = readLine() else { fatalError("Bad input") }

        grid.append(gridItem)
    }

    guard grid.count == n else { fatalError("Bad input") }

    let result = gridChallenge(grid: grid)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

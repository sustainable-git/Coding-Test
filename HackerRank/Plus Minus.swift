import Foundation

/*
 * Complete the 'plusMinus' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func plusMinus(arr: [Int]) -> Void {
    let count = arr.count
    let over = Double(arr.filter{ $0 > 0 }.count) / Double(count)
    let equal = Double(arr.filter{ $0 == 0 }.count) / Double(count)
    let under = Double(arr.filter{ $0 < 0 }.count) / Double(count)

    print(String(format: "%.6f", over))
    print(String(format: "%.6f", under))
    print(String(format: "%.6f", equal))
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)

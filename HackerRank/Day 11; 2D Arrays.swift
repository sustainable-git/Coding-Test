import Foundation

var arr = [[Int]]()

for _ in 1...6 {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == 6 else { fatalError("Bad input") }

var max: Int = -Int.max
for row in 0..<4 {
    for col in 0..<4 {
        let sum = arr[row][col] + arr[row][col+1] + arr[row][col+2] + arr[row+1][col+1]
        + arr[row+2][col] + arr[row+2][col+1] + arr[row+2][col+2]
        max = sum > max ? sum : max
    }
}

print(max)

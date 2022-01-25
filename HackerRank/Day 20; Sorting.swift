import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

var a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

var numberOfSwaps = 0
var b = a

for _ in 0..<n {
    for j in 0..<n-1 {
        if b[j] > b[j+1] {
            b.swapAt(j, j+1)
            numberOfSwaps += 1
        }
    }
}

print("Array is sorted in \(numberOfSwaps) swaps.")
print("First Element: \(b.first!)")
print("Last Element: \(b.last!)")

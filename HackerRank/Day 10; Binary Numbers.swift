import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let binary = String(n, radix: 2)
var maxCount = 0
var count = 0

for value in binary.map({ String($0) }) {
    if value == "1" {
        count += 1
        maxCount = maxCount < count ? count : maxCount
    } else {
        count = 0
    }
}

print(maxCount)

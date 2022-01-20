import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for count in 1...10 {
    print("\(n) x \(count) = \(n * count)")
}

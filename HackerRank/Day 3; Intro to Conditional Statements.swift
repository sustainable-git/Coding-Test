import Foundation

guard let N = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

if N % 2 == 1 {
    print("Weird")
} else if 2...5 ~= N {
    print("Not Weird")
} else if 6...20 ~= N {
    print("Weird")
} else if N > 20 {
    print("Not Weird")
}

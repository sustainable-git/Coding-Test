import Foundation

let N = readLine()!
if N.allSatisfy({ $0 == "0" }) {
    print("0")
} else {
    print(String(N.sorted(by: >)))
}

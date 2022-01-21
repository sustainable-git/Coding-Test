import Foundation
import Darwin

let numStrings = Int(readLine()!)!

func printEvenAndOdd(string: String) {
    let even = string.enumerated().filter { $0.offset % 2 == 0 }.map { String($0.element) }.joined()
    let odd = string.enumerated().filter { $0.offset % 2 == 1 }.map { String($0.element) }.joined()
    print(even, odd)
}

for _ in 1...numStrings {
    let inputString = readLine()!
    printEvenAndOdd(string: inputString)
}

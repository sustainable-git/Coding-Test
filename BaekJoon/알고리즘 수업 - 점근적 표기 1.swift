import Foundation

let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
let secondInput = Int(readLine()!)!
let thirdInput = Int(readLine()!)!

let a = firstInput[0]
let b = firstInput[1]
let c = secondInput
let d = thirdInput

if c < a {
    print(0)
} else if a * d + b <= c * d {
    print(1)
} else {
    print(0)
}

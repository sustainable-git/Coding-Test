import Foundation

let input = readLine()
guard let input = input, let inputNumber = Int(input) else {
    exit(-1)
}

var n = 0
var sum = 0
while inputNumber > sum {
    n += 1
    sum += n
}

let difference = sum - inputNumber
if n % 2 == 0 {
    print("\(n - difference)/\(difference + 1)")
} else {
    print("\(difference + 1)/\(n - difference)")
}

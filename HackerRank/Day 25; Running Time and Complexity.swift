import Foundation

func isPrime(_ n : Int) -> Bool {
    if n <= 1 { return false }
    else if n == 2 || n == 3 { return true }
    else {
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
        return true
    }
}

let loop = Int(String(readLine()!))!
for _ in 0..<loop {
    if isPrime(Int(String(readLine()!))!) {
        print("Prime")
    } else {
        print("Not prime")
    }
}

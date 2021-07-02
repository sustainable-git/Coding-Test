import Foundation

func isPrime(_ n : Int) -> Bool {
    if n == 2 || n == 3 { return true }
    else if n % 2 == 0 || n == 1 { return false }
    else {
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
        return true
    }
}

func solution(_ n:Int) -> Int {
    var count = 0
    for i in 1...n {
        if isPrime(i) == true { count += 1}
    }
    
    return count
}

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

func solution() {
    let n = Int(readLine()!)!
    guard n != 0 else {
        return
    }
    var count = 0
    (n+1...2*n).forEach {
        if isPrime($0) {
            count += 1
        }
    }
    print(count)
    solution()
}

solution()

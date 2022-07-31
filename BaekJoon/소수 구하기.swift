import Foundation

let MN = readLine()!.split(separator: " ").map{ Int(String($0))! }

func isPrime(_ n : Int) -> Bool {
    if n <= 1 { return false }
    else if n == 2 || n == 3 { return true }
    else if n % 2 == 0 { return false }
    else {
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
        return true
    }
}

func solution(M: Int, N: Int) {
    (M...N).forEach {
        isPrime($0) ? print($0) : Void()
    }
}

solution(M: MN[0], N: MN[1])

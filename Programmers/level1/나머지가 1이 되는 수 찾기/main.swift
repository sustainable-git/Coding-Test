import Foundation

func solution(_ n:Int) -> Int {
    guard n % 2 == 0 else { return 2 }
    let divisors = divisorsArray(of : n - 1).dropFirst()
    return divisors.first!
}

func divisorsArray(of n : Int) -> [Int] {
    var array = [Int]()
    let sqrtValue = Int(sqrt(Double(n)))
    for i in 1...sqrtValue {
        if n % i == 0 { array.append(i); array.append(n/i) }
    }
    if sqrtValue * sqrtValue == n { array.removeLast() }

    return array.sorted()
}

// 홀수이면 무조건 2다
// 짝수이면 n-1의 약수 중 가장 작은 값 (1은 안 됨)

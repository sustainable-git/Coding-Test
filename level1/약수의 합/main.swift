import Foundation

func solution(_ n:Int) -> Int {
    if n == 0 { return 0 }

    var result = 0
    let sqrtValue = Int(sqrt(Double(n)))
    let oddDivisor : Bool = sqrtValue == Int(ceil(sqrt(Double(n))))

    for i in 1...sqrtValue {
        if n % i == 0 {
            result += i
            result += n / i
        }
    }
    if oddDivisor { result -= sqrtValue }

    return result
}

func solution2(_ n : Int) -> Int {
    guard n != 0 else { return 0 }
    return Array(1...n).filter{n % $0 == 0}.reduce(0, +)
}

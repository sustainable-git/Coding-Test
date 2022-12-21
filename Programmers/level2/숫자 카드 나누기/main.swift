import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let gcdOfArrayA: Int = arrayA[1...].reduce(arrayA[0]) { gcd($0, $1) }
    let gcdOfArrayB: Int = arrayB[1...].reduce(arrayB[0]) { gcd($0, $1) }
    
    var a = 0
    var b = 0
    
    for number in divisors(of: gcdOfArrayA) {
        if arrayB.allSatisfy({ $0 % number != 0 }) {
            a = number
            break
        }
    }
    
    for number in divisors(of: gcdOfArrayB) {
        if arrayA.allSatisfy({ $0 % number != 0 }) {
            b = number
            break
        }
    }
    
    return max(a, b)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    let mod = a % b
    return mod == 0 ? b : gcd(b, mod)
}

func divisors(of n : Int) -> [Int] {
    var array = [Int]()
    let sqrtValue = Int(sqrt(Double(n)))
    for i in 1...sqrtValue {
        if n % i == 0 { array.append(i); array.append(n/i) }
    }
    if sqrtValue * sqrtValue == n { array.removeLast() }
    
    return array.sorted(by: >)
}

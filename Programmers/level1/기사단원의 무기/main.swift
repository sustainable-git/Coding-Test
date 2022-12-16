import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    return (1...number).reduce(0) {
        var weapon: Int
        let expectedPower = divisors(of: $1).count
        if expectedPower > limit {
            weapon = power
        } else {
            weapon = expectedPower
        }
        
        return $0 + weapon
    }
}

func divisors(of n : Int) -> [Int] {
    var array = [Int]()
    let sqrtValue = Int(sqrt(Double(n)))
    for i in 1...sqrtValue {
        if n % i == 0 { array.append(i); array.append(n/i) }
    }
    if sqrtValue * sqrtValue == n { array.removeLast() }
    
    return array.sorted()
}

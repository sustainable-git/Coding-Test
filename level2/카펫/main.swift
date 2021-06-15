import Foundation

func sortedDivisorArray(_ n : Int) -> [Int] {
    var array = [Int]()
    let sqrtValue = Int(sqrt(Double(n)))
    for i in 1...sqrtValue {
        if n % i == 0 { array.append(i); array.append(n/i) }
    }
    if sqrtValue * sqrtValue == n { array.removeLast() }

    return array.sorted()
}

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let totalArea = brown + yellow
    let divisorArr = sortedDivisorArray(totalArea)

    for i in divisorArr {
        guard i > 2 else { continue }
        if ((totalArea / i) - 2 ) * ( i - 2 ) == yellow {
            return [totalArea/i, i]
        }
    }

    return []
}

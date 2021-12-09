import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var result: [Int] = []
    for number in left...right {
        result.append(value(n: n, of: Int(number)))
    }
    
    return result
}

func value(n: Int, of number: Int) -> Int {
    let location: (Int, Int) = (number/n, number%n)
    return max(location.0, location.1) + 1
}

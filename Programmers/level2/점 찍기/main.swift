import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result: Int = 0
    for x in stride(from: 0, through: d, by: k) {
        let ySquare: Double = pow(Double(d), 2) - pow(Double(x), 2)
        result += Int(sqrt(ySquare)) / k + 1
    }
    
    return Int64(result)
}

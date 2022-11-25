import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let sortedScore = score.sorted(by: >)
    var count = 0
    var result = 0
    sortedScore.forEach { value in
        count += 1
        guard count == m else { return }
        count = 0
        result += value * m
    }
    
    return result
}

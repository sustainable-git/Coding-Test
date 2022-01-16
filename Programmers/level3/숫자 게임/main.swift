import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let sortedA = a.sorted(by: <)
    let sortedB = b.sorted(by: <)
    var indexA = 0
    var indexB = 0
    var score = 0
    
    while indexA < a.count && indexB < b.count {
        if sortedB[indexB] > sortedA[indexA] {
            score += 1
            indexA += 1
            indexB += 1
        } else {
            indexB += 1
        }
    }
    
    return score
}

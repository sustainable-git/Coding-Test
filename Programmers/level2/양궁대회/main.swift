import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var bestScore: Int = 1
    var result: [Int] = []
    
    func dfs(numberOfLeftArrows: Int, head: Int, ryan: [Int], apeach: [Int]) {
        if head < 0 {
            var newRyan = ryan
            if numberOfLeftArrows > 0 { newRyan[10] += numberOfLeftArrows }
            let score = scoreOfRyan(ryanScores: newRyan, apeachScores: apeach)
            if score >= bestScore {
                bestScore = score
                result = newRyan
            }
            return
        }
        
        dfs(numberOfLeftArrows: numberOfLeftArrows, head: head - 1, ryan: ryan, apeach: apeach)
        
        if numberOfLeftArrows > apeach[head] {
            var nextRyan = ryan
            let nextNumberOfArrows = numberOfLeftArrows - (apeach[head] + 1)
            nextRyan[head] = apeach[head] + 1
            dfs(numberOfLeftArrows: nextNumberOfArrows, head: head - 1, ryan: nextRyan, apeach: apeach)
        }
    }
    
    dfs(numberOfLeftArrows: n, head: 10, ryan: Array(repeating: 0, count: 11), apeach: info)
    
    return result == [] ? [-1] : result
}

func scoreOfRyan(ryanScores: [Int], apeachScores: [Int]) -> Int {
    return zip(ryanScores, apeachScores).reversed().enumerated().map {
        if $0.element.0 > $0.element.1 { return $0.offset }
        else if $0.element.0 < $0.element.1 { return -$0.offset }
        else {
            if $0.element.0 == 0 { return 0 }
            else { return -$0.offset }
        }
    }.reduce(0, +)
}

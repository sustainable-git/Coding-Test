import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    func giftSending(from giver: String, to taker: String) {
        giftIndexDictionary[giver, default: 0] -= 1
        giftIndexDictionary[taker, default: 0] += 1
        if let matrixIndexOfGiver = nameIndexDictionary[giver],
           let matrixIndexOfTaker = nameIndexDictionary[taker] {
            matrix[matrixIndexOfGiver][matrixIndexOfTaker] += 1
        }
    }
    func monthlySettlement() -> [Int] {
        var monthlySettlementResult: [Int] = Array(repeating: 0, count: friends.count)
        
        for row in 0..<friends.count {
            for col in 0..<friends.count {
                guard row != col else { continue }
                if matrix[row][col] > matrix[col][row] {
                    monthlySettlementResult[row] += 1
                } else if matrix[row][col] < matrix[col][row] {
                    continue
                } else {
                    let rowName = friends[row]
                    let colName = friends[col]
                    if let giftIndexOfRow = giftIndexDictionary[rowName],
                       let giftIndexOfCol = giftIndexDictionary[colName],
                       giftIndexOfRow < giftIndexOfCol {
                        monthlySettlementResult[row] += 1
                    }
                }
            }
        }
        
        return monthlySettlementResult
    }
    var giftIndexDictionary: [String: Int] = [:]
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    var nameIndexDictionary: [String: Int] = [:]
    
    (0..<friends.count).forEach { index in
        nameIndexDictionary.updateValue(index, forKey: friends[index])
        giftIndexDictionary.updateValue(0, forKey: friends[index])
    }
    
    gifts.forEach {
        let giverAndTaker = $0.split(separator: " ").map{ String($0) }
        guard giverAndTaker.count == 2 else { return }
        let giver = giverAndTaker[0]
        let taker = giverAndTaker[1]
        giftSending(from: giver, to: taker)
    }
    return monthlySettlement().max() ?? 0
}

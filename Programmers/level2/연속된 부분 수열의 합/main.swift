import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var resultTuple: (Int, Int)?
    var partialSequence: PartialSequence = .init(max: k)
    sequence.forEach { value in
        partialSequence.add(number: value)
        if let succeededIndexTuple = partialSequence.returnIndexIfSatisfy() {
            if let originalResultTuple = resultTuple,
               originalResultTuple.1 - originalResultTuple.0 > succeededIndexTuple.1 - succeededIndexTuple.0 {
                resultTuple = succeededIndexTuple
            } else if resultTuple == nil {
                resultTuple = succeededIndexTuple
            }
        }
    }
    guard let result = resultTuple else { return [] }
    return [result.0, result.1]
}

struct PartialSequence {
    private var array: [Int] = []
    private var startIndex: Int = 0
    private var sum: Int = 0
    private let max: Int
    
    init(max: Int) {
        self.max = max
    }
    
    mutating func add(number: Int) {
        array.append(number)
        sum += number
        removeIfExceeded()
    }
    
    private mutating func removeIfExceeded() {
        guard startIndex < array.count else { return }
        if sum > max {
            sum -= array[startIndex]
            startIndex += 1
            removeIfExceeded()
        }
    }
    
    func returnIndexIfSatisfy() -> (Int, Int)? {
        if sum == max {
            return (startIndex, array.count - 1)
        } else {
            return nil
        }
    }
}

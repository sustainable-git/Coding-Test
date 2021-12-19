import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = DoublePriorityQueue()
    
    for operation in operations {
        queue.operate(operation)
    }
    
    return queue.result()
}

struct DoublePriorityQueue {
    private var elements = [Int]()
    
    mutating func operate(_ string: String) {
        let array = string.split(separator: " ")
        guard let operation = array.first,
              let last = array.last,
              let number = Int(last),
              array.count == 2
        else {
            return
        }
        
        switch operation {
            case "I":
                elements.append(number)
            case "D":
                if number == 1 {
                    elements = elements.dropLast()
                } else if number == -1 {
                    elements = Array(elements.dropFirst())
                }
            default : break
        }
        elements.sort()
    }
    
    func result() -> [Int] {
        let max = elements.max() ?? 0
        let min = elements.min() ?? 0
        
        return [max, min]
    }
}

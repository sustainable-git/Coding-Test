import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var indexStack: [Int] = []
    var result = Array(repeating: -1, count: numbers.count)
    
    for (index, value) in numbers.enumerated() {
        while let lastIndex = indexStack.last {
            if value > numbers[lastIndex] {
                result[lastIndex] = value
                _ = indexStack.popLast()
            } else {
                break
            }
        }
        indexStack.append(index)
    }
    
    return result
}

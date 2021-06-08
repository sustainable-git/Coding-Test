import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var resultSet = Set<Int>()
    
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            resultSet.insert(numbers[i]+numbers[j])
        }
    }
    let result = Array(resultSet)

    return result.sorted()
}

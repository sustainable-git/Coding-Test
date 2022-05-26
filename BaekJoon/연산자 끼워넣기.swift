import Foundation

_ = readLine()!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let operators = readLine()!.split(separator: " ").map { Int(String($0))! }

guard operators.count == 4 && operators.reduce(0, +) + 1 == numbers.count else {
    exit(-1)
}

func solution(numbers: [Int], operators: [Int]) -> (max: Int, min: Int) {
    var result: [Int] = []
    dfs(numbers: numbers, index: 1, leftOperators: operators, currentValue: numbers[0], result: &result)
    result.sort()
    
    return (max: result.last!, min: result.first!)
}

func dfs(numbers: [Int], index: Int, leftOperators: [Int], currentValue: Int, result: inout [Int]) {
    if index == numbers.count {
        result.append(currentValue)
        return
    }
    
    for operatorIndex in 0..<leftOperators.count {
        guard leftOperators[operatorIndex] > 0 else { continue }
        var nextLeftOperators = leftOperators
        nextLeftOperators[operatorIndex] -= 1
        
        switch operatorIndex {
        case 0:
            dfs(numbers: numbers, index: index + 1, leftOperators: nextLeftOperators, currentValue: currentValue + numbers[index], result: &result)
        case 1:
            dfs(numbers: numbers, index: index + 1, leftOperators: nextLeftOperators, currentValue: currentValue - numbers[index], result: &result)
        case 2:
            dfs(numbers: numbers, index: index + 1, leftOperators: nextLeftOperators, currentValue: currentValue * numbers[index], result: &result)
        case 3:
            dfs(numbers: numbers, index: index + 1, leftOperators: nextLeftOperators, currentValue: currentValue / numbers[index], result: &result)
        default:
            exit(-2)
        }
    }
}

let result = solution(numbers: numbers, operators: operators)
print(result.max, result.min, separator: "\n")

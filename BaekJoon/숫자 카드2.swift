import Foundation

let n = readLine()
let arr1 = readLine()!.split(separator: " ").map{ Int(String($0))! }
let m = readLine()
let arr2 = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(arr1: [Int], arr2: [Int]) -> [String] {
    var dictionary: Dictionary<Int, Int> = [:]
    var result: [String] = []
    
    arr1.forEach {
        dictionary[$0, default: 0] += 1
    }
    arr2.forEach {
        result.append("\(dictionary[$0, default: 0])")
    }
    
    return result
}

print(solution(arr1: arr1, arr2: arr2).joined(separator: " "))


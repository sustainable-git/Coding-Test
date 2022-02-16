import Foundation

let n = readLine()
let arr1 = readLine()!.split(separator: " ").map{ Int(String($0))! }
let m = readLine()
let arr2 = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(arr1: [Int], arr2: [Int]) -> [String] {
    let sortedArr = arr1.sorted()
    var result: [String] = []
    
    arr2.forEach {
        var low: Int = 0
        var mid: Int
        var high: Int = sortedArr.count - 1
        
        while low <= high {
            mid = (low + high) / 2
            if $0 > sortedArr[mid] {
                low = mid + 1
            } else if $0 < sortedArr[mid] {
                high = mid - 1
            } else {
                result.append("1")
                return
            }
        }
        result.append("0")
    }
    
    return result
}

print(solution(arr1: arr1, arr2: arr2).joined(separator: " "))

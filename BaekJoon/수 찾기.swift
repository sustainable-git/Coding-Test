import Foundation

let n: Int = Int(readLine()!)!
let arr1: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
let m: Int = Int(readLine()!)!
let arr2: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(arr1: [Int], arr2:[Int]) -> [Int] {
    let sortedArr = arr1.sorted()
    var result: [Int] = []
    
    arr2.forEach {
        var low = 0
        var mid = 0
        var high = sortedArr.count - 1
        while low <= high {
            mid = (low + high) / 2
            if sortedArr[mid] == $0 {
                result.append(1)
                return
            } else if sortedArr[mid] < $0 {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        result.append(0)
    }
    
    return result
}

solution(arr1: arr1, arr2: arr2).forEach{
    print($0)
}

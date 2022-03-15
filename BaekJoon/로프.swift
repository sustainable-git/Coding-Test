import Foundation

let N = Int(readLine()!)!
var arr = [Int]()

(0..<N).forEach { _ in
    arr.append( Int(readLine()!)! )
}

func solution(arr: [Int]) -> Int {
    let sortedArr = arr.sorted(by: <)
    var max: Int = 0
    
    for element in sortedArr {
        let index = binarySearch(sortedArr: sortedArr, target: element)
        let totalWeight = (sortedArr.count - index) * element
        max = max > totalWeight ? max : totalWeight
    }
    
    return max
}

func binarySearch(sortedArr: [Int], target: Int) -> Int {
    var low: Int = 0
    var high: Int = sortedArr.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if sortedArr[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return low
}

print(solution(arr: arr))

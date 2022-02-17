import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
(0..<N).forEach { _ in
    let value = Int(readLine()!)!
    arr.append(value)
}

func solution(N: Int, arr: [Int]) -> Int {
    let sortedArr = arr.sorted(by: <)
    var dict: Dictionary<Int, Bool> = [:]
    for i in 0..<sortedArr.count {
        for j in i..<sortedArr.count {
            dict.updateValue(true, forKey: sortedArr[i] + sortedArr[j])
        }
    }
    let sums: [Int] = dict.map{ $0.key }.sorted()
    
    for i in (0..<sortedArr.count).reversed() {
        for j in 0..<sortedArr.count {
            let difference = sortedArr[i] - sortedArr[j]
            var low = 0
            var high = sums.count - 1
            while low <= high {
                let mid = (low + high) / 2
                if sums[mid] < difference {
                    low = mid + 1
                } else if sums[mid] > difference {
                    high = mid - 1
                } else {
                    return sortedArr[i]
                }
            }
            
        }
    }
    
    return -1
}

print(solution(N: N, arr: arr))

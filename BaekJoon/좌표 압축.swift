import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(n: Int, arr: [Int]) -> [Int] {
    let sortedArr = arr.removeDuplicates().sorted()
    var dict: Dictionary<Int, Int> = [:]
    var result: [Int] = []
    
    arr.forEach {
        if let alreadyChecked = dict[$0] {
            result.append(alreadyChecked)
            return
        }
        
        var low = 0
        var high = sortedArr.count - 1
        
        while low <= high {
            let mid = (low + high) / 2
            if $0 > sortedArr[mid] {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        dict.updateValue(low, forKey: $0)
        result.append(low)
    }
    
    return result
}

solution(n: n, arr: arr).forEach {
    print($0, terminator: " ")
}

extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var dict: Dictionary<Element, Bool> = [:]
        return filter{ dict.updateValue(true, forKey: $0) == nil }
    }
}

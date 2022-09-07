```swift
import Foundation

func binarySearchIndexGreaterOrEqual(to number: Int, in array: [Int]) -> Int {
    var low = 0
    var mid = 0
    var high = array.count - 1
    
    while low <= high {
        mid = (low + high) / 2
        if array[mid] < number {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return low
}

func binarySearchIndexLowerOrEqual(to number: Int, in array: [Int]) -> Int {
    var low = 0
    var mid = 0
    var high = array.count - 1
    
    while low <= high {
        mid = (low + high) / 2
        if array[mid] <= number {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return high
}

```

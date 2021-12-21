```swift
// array should be sorted
// array should have at least one element
// array should have at least one target
func binarySearch(in array: [Int], target: Int) -> Int {
    var low = 0
    var mid = 0
    var high = array.count - 1
    
    while low <= high {
        mid = (low + high) / 2
        if array[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return low
}
```

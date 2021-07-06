```swift
func divisorArray(_ n : Int) -> [Int] {
    var array = [Int]()
    let sqrtValue = Int(sqrt(Double(n)))
    for i in 1...sqrtValue {
        if n % i == 0 { array.append(i); array.append(n/i) }
    }
    if sqrtValue * sqrtValue == n { array.removeLast() }
    
    return array.sorted()
}
```

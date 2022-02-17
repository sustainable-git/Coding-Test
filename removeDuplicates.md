```swift
extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var dict: Dictionary<Element, Bool> = [:]
        return filter{ dict.updateValue(true, forKey: $0) == nil }
    }
}
```

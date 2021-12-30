# Swift Algorithm

## Contents

### String
- Adding
```swift
var sample = "Hello"
sample += " World" // sample == "Hello World"
sample.append("!") // sample == "Hello World!"
```
- Accessing String Element
```swift
let name = "Marie Curie"
let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
let firstName = name[..<firstSpace] // firstName == "Marie"
```
- Searching
 ```swift
import Foundation // necessary

let string = "Swift"
print(string.contains("ft")) // true
print(string[string.index(string.startIndex, offsetBy: 4)]) // t
```
- Ascii
```swift
let char = "A"
UnicodeScalar(char)!.value // 65 : UInt32
```
- Radix
```swift
let number = String(10, radix: 2) // you can add uppercase: Bool
print(number) // number : String = 1010
```
- Replacing
```swift
import Foundation // necessary

var id = "super..power"
id = id.replacingOccurrences(of: "..", with: ".") // id == "super.power"
```
- Removing
```swift
var name = "edkward"
let wrongPosition = name.firstIndex(of: "k")
name.remove(at: wrongPosition!) // name == edward
name.removeFirst() // name == dward
name.removeLast() // name == dwar
```
- Trimming
```swift
import Foundation // necessary

var name = "(hermione)))))"
name = name.trimmingCharacters(in: ["(",")"]) // in : CharacterSet
// name == hermione
```
- Format
```swift
let num = 5
print(String(format: "%02d", num)) // 05
```
<br>

### Regular Expression

```swift
func isMatched(target: String, pattern: String) -> Bool {
      let patternString = "^" + pattern.replacingOccurrences(of: "*", with: "[a-zA-Z0-9]") + "$" // "^": start, "$": end
      let regex = try? NSRegularExpression(pattern: patternString)
      return regex?.firstMatch(in: target, options: [], range: NSRange(location: 0, length: target.count)) != nil
 }
```

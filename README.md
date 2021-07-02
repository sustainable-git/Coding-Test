# Swift Algorithm

## Contents

### String
- Adding
```
var sample = "Hello"
sample += " World" // sample == "Hello World"
sample.append("!") // sample == "Hello World!"
```
- Accessing String Element
```
let name = "Marie Curie"
let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
let firstName = name[..<firstSpace] // firstName == "Marie"
```
- Searching
 ```
import Foundation // necessary

let string = "Swift"
print(string.contains("ft")) // true
print(string[string.index(string.startIndex, offsetBy: 4)]) // t
```
- Ascii
```
let char = "A"
UnicodeScalar(char)!.value // 65 : UInt32
```
- Radix
```
let number = String(10, radix: 2) // you can add uppercase: Bool
print(number) // number : String = 1010
```
- replacing
```
import Foundation // necessary

var id = "super..power"
id = id.replacingOccurrences(of: "..", with: ".") // id == "super.power"
```
- removing
```
var name = "edkward"
let wrongPosition = name.firstIndex(of: "k")
name.remove(at: wrongPosition!) // name == edward
name.removeFirst() // name == dward
name.removeLast() // name = dwar
```
- trimming
```
import Foundation // necessary

var name = "(hermione)))))"
name = name.trimmingCharacters(in: ["(",")"]) // in : CharacterSet
// name == hermione
```

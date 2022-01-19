var i = 4
var d = 4.0
var s = "HackerRank "

var inputArray: Array<String> = []
inputArray.reserveCapacity(3)

for _ in 0..<3 {
    let input: String = readLine()!
    inputArray.append(input)
}

print(i+Int(inputArray[0])!)
print(d+Double(inputArray[1])!)
print(s+inputArray[2])

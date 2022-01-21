let n: Int = Int(readLine()!)!
var dictionary: Dictionary<String, String> = [:]

for _ in 0..<n {
    let input: [String] = readLine()!.split(separator: " ").map{ String($0) }
    dictionary.updateValue(input[1], forKey: input[0])
}

while true {
    guard let input: String = readLine() else { break }
    if let result = dictionary[input] {
        print(input, "=", result, separator: "")
    } else {
        print("Not found")
    }
}

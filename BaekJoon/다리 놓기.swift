import Foundation

struct BridgeCase: Hashable {
    let n: Int
    let m: Int
}

var dictionary: [BridgeCase: Int] = [:]
let numberString = readLine()
guard let numberString = numberString,
      let number = Int(numberString) else {
    exit(0)
}

(0..<number).forEach { _ in
    let input = readLine()?.split(separator: " ").map { Int(String($0)) }
    guard let input = input,
          let n = input[0],
          let m = input[1]
    else {
        return
    }
    print(calculate(bridgeCase: BridgeCase(n: n, m: m)))
}

func calculate(bridgeCase: BridgeCase) -> Int {
    if let numberOfCase = dictionary[bridgeCase] {
        return numberOfCase
    } else {
        let (n, m) = (bridgeCase.n, bridgeCase.m)
        if n == m {
            dictionary.updateValue(1, forKey: bridgeCase)
            return 1
        } else if n == 1 {
            dictionary.updateValue(m, forKey: bridgeCase)
            return m
        } else {
            let result = (n...m).reduce(0) { $0 +
                calculate(bridgeCase: BridgeCase(n: n - 1, m: $1 - 1))
            }
            dictionary.updateValue(result, forKey: bridgeCase)
            return result
        }
    }
}

import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var count: Int64 = 0
    var weightDictionary = weights.reduce(into: [:]) { counts, weight in
        counts[weight, default: 0] += 1
    }
    weightDictionary.forEach {
        if $0.value > 1 {
            count += Int64(combination(n: $0.value, r: 2))
        }
        if $0.key * 2 % 3 == 0,
           let numberOfElements = weightDictionary[$0.key * 2 / 3] {
            count += Int64($0.value * numberOfElements)
        }
        if $0.key * 2 % 4 == 0,
           let numberOfElements = weightDictionary[$0.key * 2 / 4] {
            count += Int64($0.value * numberOfElements)
        }
        if $0.key * 3 % 4 == 0,
           let numberOfElements = weightDictionary[$0.key * 3 / 4] {
            count += Int64($0.value * numberOfElements)
        }
    }
    
    return count
}

private func combination(n: Int, r: Int) -> Int {
    guard n >= 1,
          n >= r else { return 0}
    return (0..<r).reduce(1) { $0 * (n - $1) } / factorial(r)
}

private func factorial(_ number: Int) -> Int {
    guard number > 1 else { return 1 }
    return number * factorial(number - 1)
}

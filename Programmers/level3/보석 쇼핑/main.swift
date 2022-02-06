import Foundation

func solution(_ gems:[String]) -> [Int] {
    var totalGemKinds: Set<String> = []
    gems.forEach{ totalGemKinds.update(with: $0) }
    var gemDictionary: Dictionary<String, Int> = [:]
    var head: Int = 0
    var tail: Int = 0
    var result: (Int, Int) = (head, tail)
    
    while gemDictionary.keys.count < totalGemKinds.count {
        defer { tail += 1 }
        let gem = gems[tail]
        gemDictionary[gem, default: 0] += 1
    }
    result = (head + 1, tail)
    
    while tail <= gems.count {
        defer {
            if tail - (head + 1) < result.1 - result.0 {
                result = (head + 1, tail)
            }
        }
        
        let headGem = gems[head]
        
        if gemDictionary[headGem]! >= 2 {
            gemDictionary[headGem]! -= 1
            head += 1
            continue
        }
        
        if tail == gems.count {
            break
        } else {
            let tailGem = gems[tail]
            gemDictionary[tailGem]! += 1
            tail += 1
        }
    }
    
    return [result.0, result.1]
}

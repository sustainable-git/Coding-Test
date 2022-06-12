import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var neverSeen: [String] = []
var neverHeard: [String] = []

(0..<NM[0]).forEach { _ in
    neverSeen.append(readLine()!)
}

(0..<NM[1]).forEach { _ in
    neverHeard.append(readLine()!)
}


func solution(neverSeen: [String], neverHeard: [String]) -> [String] {
    var setOfNeverSeen: Set<String> = []
    var result: [String] = []
    neverSeen.forEach {
        setOfNeverSeen.update(with: $0)
    }
    neverHeard.forEach {
        if setOfNeverSeen.contains($0) {
            result.append($0)
        }
    }
    return result.sorted()
}

let result: [String] = solution(neverSeen: neverSeen, neverHeard: neverHeard)
print(result.count)
result.forEach {
    print($0)
}

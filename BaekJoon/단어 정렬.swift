import Foundation

let N = Int(readLine()!)!
var set: Set<String> = []

(0..<N).forEach { _ in
    let word = readLine()!
    set.update(with: word)
}

Array(set).sorted {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}.forEach {
    print($0)
}

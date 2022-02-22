import Foundation

func solution() -> [Int] {
    var notSelfNumbers: Set<Int> = []
    
    (1...10000).forEach { number in
        var n = number
        var sum = n
        while n != 0 {
            sum += n % 10
            n /= 10
        }
        notSelfNumbers.update(with: sum)
    }
    
    return Array(1...10000).filter{ !notSelfNumbers.contains($0) }
}

solution().forEach {
    print($0)
}

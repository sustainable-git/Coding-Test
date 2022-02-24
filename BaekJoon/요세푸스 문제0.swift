import Foundation

struct JosephusArray {
    private var arr: [Int]
    private var lastRemovedPosition = 0
    var count: Int { arr.count }
    
    init(N: Int) {
        self.arr = Array(1...N)
    }
    
    mutating func remove(th number: Int) -> Int {
        let index = (lastRemovedPosition + number - 1) % arr.count
        lastRemovedPosition = index
        return arr.remove(at: index)
    }
}

let NK = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(N: Int, K: Int) -> String {
    var josephus = JosephusArray(N: N)
    var result: [Int] = []
    while josephus.count != 0 {
        result += [josephus.remove(th: K)]
    }
    return "<" + result.map{ String($0) }.joined(separator: ", ") + ">"
}

print(solution(N: NK[0], K: NK[1]))

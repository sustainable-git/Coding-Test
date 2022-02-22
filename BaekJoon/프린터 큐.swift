import Foundation

let N = Int(readLine()!)!

func calculate(M: Int, documents: [Int]) -> Int {
    let enumeratedDocuments = documents.enumerated().map { $0 }
    let queue = Queue(enumeratedDocuments)
    return queue.print(order: M)
}

class Queue {
    private var queue: [EnumeratedSequence<[Int]>.Element]
    private var head: Int = 0
    private var count: Int = 0
    private var maxValue: Int {
        return queue[head..<queue.endIndex].max{ $0.element < $1.element }!.element
    }
    
    init(_ documents: [EnumeratedSequence<[Int]>.Element]) {
        self.queue = documents
    }
    
    func print(order: Int) -> Int {
        while true {
            defer { head += 1 }
            if queue[head].element == maxValue {
                count += 1
                if queue[head].offset == order { return count }
            } else {
                queue.append(queue[head])
            }
        }
    }
}

var result: [Int] = []

(1...N).forEach { _ in
    let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let documents = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    result.append(calculate(M: NM[1], documents: documents))
}

result.forEach {
    print($0)
}

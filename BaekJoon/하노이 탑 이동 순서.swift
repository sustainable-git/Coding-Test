//1 3
//
//1 2, (1 3), 2 3
//            // 1 이 2로, 2가 3으로, 3이 1로
//
//1 3, 1 2, 3 2, (1 3), 2 1, 2 3, 1 3
//
//1 2, 1 3, 2 3, 1 2, 3 1, 3 2, 1 2, (1 3), 2 3, 2 1, 3 1, 2 3, 1 2, 1 3, 2 3
//
//// -1번째 수에서 2와 3이 변경됨, (1, 3) 왼쪽꺼에서 1이 2로, 2가 3으로, 3이 1로

import Foundation

let N = Int(readLine()!)!

func solution(N: Int) -> [String] {
    var result: [[Node]] = [[Node(start: 1, next: 3)]]
    guard N > 1 else { return ["1", "1 3"] }
    
    for index in 0..<N-1 {
        var current: [Node] = []
        let lastResult = result[index]
        
        lastResult.forEach {
            var start = 0
            var next = 0
            
            if $0.start == 1 { start = 1 }
            if $0.start == 2 { start = 3 }
            if $0.start == 3 { start = 2 }
            
            if $0.next == 1 { next = 1 }
            if $0.next == 2 { next = 3 }
            if $0.next == 3 { next = 2 }
            
            current.append(Node(start: start, next: next))
        }
        
        let count = current.count
        current.append(Node(start: 1, next: 3))
        
        for beforeIndex in 0..<count {
            var start = 0
            var next = 0
            
            if current[beforeIndex].start == 1 { start = 2 }
            if current[beforeIndex].start == 2 { start = 3 }
            if current[beforeIndex].start == 3 { start = 1 }
            
            if current[beforeIndex].next == 1 { next = 2 }
            if current[beforeIndex].next == 2 { next = 3 }
            if current[beforeIndex].next == 3 { next = 1 }
            
            current.append(Node(start: start, next: next))
        }
        
        result.append(current)
    }
    
    return [String(result.last!.count), result.last!.map { "\($0.start) \($0.next)"}.joined(separator: "\n")]
}

struct Node: CustomStringConvertible {
    var description: String {
        return "\(start) \(next)"
    }
    
    let start: Int
    let next: Int
}

solution(N: N).forEach {
    print($0)
}


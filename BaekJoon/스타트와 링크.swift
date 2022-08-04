import Foundation

let N = Int(readLine()!)!
var S: [[Int]] = []
(0..<N).forEach { _ in
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    S.append(input)
}

func solution(S: [[Int]]) -> Int {
    let n = S.count
    let indexArr = Array((0..<n))
    var result: [Int] = []
    
    func bt(head: Int, start: [Int], link: [Int]) {
        guard start.count + link.count <= n else { return }
        if start.count + link.count == n {
            guard start.count == link.count else { return }
            var sumOfStart = 0
            var sumOfLink = 0
            start.forEach { row in
                start.forEach { col in
                    sumOfStart += S[row][col]
                }
            }
            link.forEach { row in
                link.forEach { col in
                    sumOfLink += S[row][col]
                }
            }
            
            result.append(abs(sumOfStart - sumOfLink))
            return
        }
        
        bt(head: head + 1, start: start + [indexArr[head]], link: link)
        bt(head: head + 1, start: start, link: link + [indexArr[head]])
    }
    
    bt(head: 0, start: [], link: [])
    
    return result.min()!
}

print(solution(S: S))

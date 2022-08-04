import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }

func solution(N n: Int, M m: Int) {
    let arr = Array((1...n))
    
    func bt(depth: Int, head: Int, current: [Int]) {
        if m == current.count {
            print(current.map{ String($0) }.joined(separator: " "))
            return
        }
        if head >= arr.count { return }
        bt(depth: depth + 1, head: head + 1, current: current + [arr[head]])
        bt(depth: depth + 1, head: head + 1, current: current)
    }
    
    bt(depth: 0, head: 0, current: [])
}

solution(N: NM[0], M: NM[1])

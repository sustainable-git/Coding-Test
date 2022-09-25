import Foundation

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(N: Int, M: Int) {
    func bt(size: Int, array: [String]) {
        if array.count >= size {
            print(array.joined(separator: " "))
            return
        }
        
        (1...N).forEach {
            bt(size: size, array: array + [String($0)])
        }
    }
    
    bt(size: M, array: [])
}

solution(N: NM[0], M: NM[1])

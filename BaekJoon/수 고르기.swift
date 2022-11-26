import Foundation

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var arr: [Int] = []
(0..<NM[0]).forEach { _ in
    let number = Int(readLine()!)!
    arr.append(number)
}

func solution(M: Int, arr: [Int]) -> Int {
    let sortedArr = arr.sorted(by: <)
    var minDifferece = Int.max
    var head = 0
    
    for index in 0..<sortedArr.count - 1 {
        while sortedArr[head] - sortedArr[index] < M {
            head += 1
            guard head < sortedArr.count else { return minDifferece }
        }
        
        let difference = sortedArr[head] - sortedArr[index]
        if difference == M { return M }
        else { minDifferece = min(difference, minDifferece) }
    }
    
    return minDifferece
}

print(solution(M: NM[1], arr: arr))

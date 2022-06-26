import Foundation

let T: Int = Int(readLine()!)!
var cases: [Array<Int>] = []
(0..<T).forEach { _ in
    let testCase = readLine()!.split(separator: " ").map { Int(String($0))! }
    cases.append(testCase)
}

func solution(testCase: Array<Int>) -> Int {
    guard testCase.count == 6 else { exit(-1) }
    let x1 = Double(testCase[0])
    let y1 = Double(testCase[1])
    let r1 = Double(testCase[2])
    let x2 = Double(testCase[3])
    let y2 = Double(testCase[4])
    let r2 = Double(testCase[5])
    
    if x1 == x2 && y1 == y2 {
        if r1 == r2 {
            return -1
        } else {
            return 0
        }
    }
    
    let difference = sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
    
    if difference > r1 + r2 {
        return 0
    }
    
    if difference == r1 + r2 {
        return 1
    }
    
    if difference < r1 + r2 {
        if max(r1, r2) > min(r1, r2) + difference {
            return 0
        }
        if max(r1, r2) == min(r1, r2) + difference {
            return 1
        }
    }
    
    return 2
}

cases.forEach { testCase in
    print(solution(testCase: testCase))
}

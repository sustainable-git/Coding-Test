import Foundation

let ABV = readLine()!.split(separator: " ").map { Int(String($0))! }

func solution(A: Int, B: Int, V: Int) -> Int {
    let left = V - A
    guard left > 0 else { return 1 }
    return Int(ceil(Double(left) / Double(A - B))) + 1
}

print(solution(A: ABV[0], B: ABV[1], V: ABV[2]))

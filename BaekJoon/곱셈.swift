import Foundation

let ABC = readLine()!.split(separator: " ").map { Int(String($0))! }

func solution(A: Int, B: Int, C:Int) -> Int {
    if B == 1 { return A % C }
    
    if B % 2 == 0 {
        let result = solution(A: A, B: B/2, C: C)
        return result % C * result % C
    } else {
        let result = solution(A: A, B: B/2, C: C)
        return result % C * result % C * A % C
    }
}

print(solution(A: ABC[0], B: ABC[1], C: ABC[2]))

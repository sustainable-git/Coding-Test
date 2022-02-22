import Foundation

let NMB = readLine()!.split(separator: " ").map{ Int(String($0))! }
var matrix: [[Int]] = []

(1...NMB[0]).forEach { _ in
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    matrix.append(arr)
}

func time(matrix: [[Int]], B: Int, height target: Int) -> Int? {
    var minus: Int = 0
    var plus: Int = 0
    matrix.forEach { arr in
        arr.forEach {
            let difference: Int = $0 - target
            if difference <= 0 {
                minus -= difference
            } else {
                plus += difference
            }
        }
    }
    if plus - minus + B < 0 { return nil }
    else { return plus * 2 + minus }
}

func solution(matrix: [[Int]], B: Int) -> [Int] {
    let results: [Int?] = (0...256).map{ time(matrix: matrix, B: B, height: $0)}
    let minValue = results.compactMap{ $0 }.min()!
    return [minValue, Int(results.lastIndex(of: minValue)!)]
}

solution(matrix: matrix, B: NMB[2]).forEach{
    print($0, terminator: " ")
}

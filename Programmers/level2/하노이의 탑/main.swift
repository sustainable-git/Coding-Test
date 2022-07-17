import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result: [[[Int]]] = [[], [[1, 3]]]
    guard n >= 2 else { return result[1] }
    for index in 1..<n {
        let leftArray = changeNumber(A: 2, B: 3, of: result[index])
        let midArray = [[1, 3]]
        let rightArray = changeNumber(A: 1, B: 2, of: result[index])
        result.append(leftArray + midArray + rightArray)
    }
    
    return result[n]
}

func changeNumber(A: Int, B: Int, of array: [[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    for elements in array {
        let tranferredElements = elements.map { number -> Int in
            if number == A {
                return B
            } else if number == B {
                return A
            } else {
                return number
            }
        }
        result.append(tranferredElements)
    }
    return result
}

// 직전의 것에서 2와 3을 바꾸면 된다 // (1, 3)을 넣으면 된다 //1과 2를 바꾸면 된다
// (1, 3)
// (1, 2) (1, 3) (2, 3)
// (1, 3) (1, 2) (3, 2) (1, 3) (2, 1) (2, 3) (1, 3)

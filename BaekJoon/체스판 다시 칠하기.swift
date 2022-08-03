import Foundation

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var arr: [[String]] = []
(0..<NM[0]).forEach { _ in
    let input = readLine()!.map{ String($0) }
    arr.append(input)
}

func minChange(arr: [[String]]) -> Int {
    var countA = 0
    var countB = 0
    for i in 0..<arr.count {
        for j in 0..<arr[0].count {
            if (i + j) % 2 == 0 {
                if arr[i][j] != "W" {
                    countA += 1
                } else if arr[i][j] != "B" {
                    countB += 1
                }
            } else {
                if arr[i][j] != "B" {
                    countA += 1
                } else if arr[i][j] != "W" {
                    countB += 1
                }
            }
        }
    }
    return min(countA, countB)
}

var result: [Int] = []
for rowOffset in (0...NM[0] - 8) {
    for colOffset in (0...NM[1] - 8) {
        var newStringMatrix: [[String]] = []
        
        for row in (rowOffset..<rowOffset + 8) {
            let newStringArr = Array(arr[row][colOffset..<colOffset+8])
            newStringMatrix.append(newStringArr)
        }
        
        result.append(minChange(arr: newStringMatrix))
    }
    
}

print(result.min()!)

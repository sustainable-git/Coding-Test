import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var resultArr = Array(repeating: Array(repeating: 0, count: arr2[0].count) , count: arr1.count)

    for rowIndex in 0..<resultArr.count {
        for colIndex in 0..<resultArr[0].count {
            var element = [Int]()
            for i in 0..<arr2.count {
                element.append(arr1[rowIndex][i] * arr2[i][colIndex])
            }
            resultArr[rowIndex][colIndex] = element.reduce(0, +)
        }
    }
    return resultArr
}

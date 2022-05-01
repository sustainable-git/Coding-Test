import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var matrix = Matrix(rows: rows, cols: columns)
    var result: [Int] = []
    queries.forEach { query in
        guard let minNumber = matrix.rotate(query: query) else { exit(-1) }
        result.append(minNumber)
    }
    
    return result
}

struct Matrix {
    var matrix: [[Int]]
    
    init(rows: Int, cols: Int) {
        self.matrix = []
        var number = 1
        (0..<rows).forEach { _ in
            var row = [Int]()
            (0..<cols).forEach { _ in
                row.append(number)
                number += 1
            }
            matrix.append(row)
        }
    }
    
    mutating func rotate(query: [Int]) -> Int? {
        guard query.count == 4 else { return nil }
        var nums: [Int] = []
        let leftTop = (row: query[0] - 1, col: query[1] - 1)
        let rightBottom = (row: query[2] - 1, col: query[3] - 1)
        let startNumber = self.matrix[leftTop.row][leftTop.col]
        nums.append(startNumber)
        for i in leftTop.row..<rightBottom.row {
            let number = self.matrix[i+1][leftTop.col]
            nums.append(number)
            self.matrix[i][leftTop.col] = number
        }
        for j in leftTop.col..<rightBottom.col {
            let number = self.matrix[rightBottom.row][j+1]
            nums.append(number)
            self.matrix[rightBottom.row][j] = number
        }
        for k in (leftTop.row+1...rightBottom.row).reversed() {
            let number = self.matrix[k-1][rightBottom.col]
            nums.append(number)
            self.matrix[k][rightBottom.col] = number
        }
        for l in (leftTop.col+1...rightBottom.col).reversed() {
            let number = self.matrix[leftTop.row][l-1]
            nums.append(number)
            self.matrix[leftTop.row][l] = number
        }
        self.matrix[leftTop.row][leftTop.col + 1] = startNumber
        
        return nums.min()
    }
}

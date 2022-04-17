import Foundation

let N = Int(readLine()!)!

func solution(N: Int) -> Int {
    var board = ChessBoard(n: N)
    board.nQueen(row: 0)
    
    return board.count
}

print(solution(N: N))

struct ChessBoard {
    var size: Int
    var isUsed1: [Bool]
    var isUsed2: [Bool]
    var isUsed3: [Bool]
    var count = 0
    
    init(n: Int) {
        self.size = n
        self.isUsed1 = Array(repeating: false, count: n)
        self.isUsed2 = Array(repeating: false, count: 2 * n - 1)
        self.isUsed3 = Array(repeating: false, count: 2 * n - 1)
    }
    
    mutating func nQueen(row: Int) {
        if row == self.size {
            self.count += 1
            return
        }
        
        for col in 0..<self.size {
            if self.isOkayToPut(row: row, col: col) {
                self.isUsed1[col] = true
                self.isUsed2[row + col] = true
                self.isUsed3[row - col + self.size - 1] = true
                self.nQueen(row: row + 1)
                self.isUsed1[col] = false
                self.isUsed2[row + col] = false
                self.isUsed3[row - col + self.size - 1] = false
            }
        }
    }
    
    func isOkayToPut(row: Int, col: Int) -> Bool {
        if self.isUsed1[col] == true { return false }
        if self.isUsed2[row + col] == true { return false }
        if self.isUsed3[row - col + self.size - 1] == true { return false }
        return true
    }
}

import Foundation

func solution(_ n:Int) -> Int {
    var result: Int = 0
    let chessBoard = ChessBoard(by: n)
    backTracking(n: n, count: 0, chessBoard: chessBoard, result: &result)
    
    return result
}

func backTracking(n: Int, count: Int, chessBoard: ChessBoard, result: inout Int) {
    if n == count {
        result += 1
        return
    }
    for col in 0..<n {
        let position: Int = count * n + col
        if chessBoard.isGoodToPut(at: position) {
            var newChessBoard = chessBoard
            newChessBoard.putQuene(at: position)
            backTracking(n: n, count: count + 1, chessBoard: newChessBoard, result: &result)
        }
    }
}

struct ChessBoard: CustomStringConvertible {
    var description: String {
        return board.map {
            $0.map {
                $0 == true ? "Q" : "X"
            }.joined(separator: "")
        }.joined(separator: "\n")
    }
    
    var n: Int
    var board: [[Bool]]
    
    init(by n: Int) {
        self.n = n
        self.board = Array(repeating: Array(repeating: false, count: n), count: n)
    }
    
    func isGoodToPut(at : Int) -> Bool {
        let col: Int = at / n
        let row: Int = at % n
        for index in 0..<col {
            if self.board[row][index] == true { return false }
        }
        for index in 0..<row {
            if self.board[index][col] == true { return false }
        }
        for index in 0...min(row, col) {
            if self.board[row-index][col-index] == true { return false }
        }
        for index in 0...max(row, col) {
            if row+index < n && col-index >= 0 && self.board[row+index][col-index] == true { return false }
            if row-index >= 0 && col+index < n && self.board[row-index][col+index] == true { return false}
        }
        return true
    }
    
    mutating func putQuene(at: Int) {
        let col: Int = at / n
        let row: Int = at % n
        self.board[row][col] = true
    }
}

import Foundation

func solution(_ board:[String]) -> Int {
    let numberOfOs = board.reduce(0) { $0 + $1.filter{ $0 == "O" }.count }
    let numberOfXs = board.reduce(0) { $0 + $1.filter{ $0 == "X" }.count }
    
    guard 0...1 ~= numberOfOs - numberOfXs else { return 0 }
    guard !(isTicTacToe(mark: "O", board: board) && isTicTacToe(mark: "X", board: board)) else { return 0 }
    if isTicTacToe(mark: "O", board: board) {
        guard numberOfOs == numberOfXs + 1 else { return 0 }
    }
    if isTicTacToe(mark: "X", board: board) {
        guard numberOfOs == numberOfXs else { return 0 }
    }
    
    return 1
}

func isTicTacToe(mark: String, board: [String]) -> Bool {
    let board: [[String]] = board.map{ $0.map{ String($0) }}
    
    for oneRowOfBoard in board {
        if oneRowOfBoard.allSatisfy({ $0 == mark }) { return true }
    }
    for index in 0..<board[0].count {
        if board.map({ $0[index] }).allSatisfy({ String($0) == mark }) { return true }
    }
    if (0..<board.count).map({ board[$0][$0] }).allSatisfy({ String($0) == mark }) { return true }
    if (0..<board.count).map({ board[$0][2 - $0] }).allSatisfy({ String($0) == mark }) { return true }
    return false
}

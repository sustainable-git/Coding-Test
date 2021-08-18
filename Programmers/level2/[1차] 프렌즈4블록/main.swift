import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map{ $0.map{String($0)} }
    var matrix = [[Int]]()
    
    repeat {
        matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for height in 1..<m {
            for width in 1..<n {
                let char = board[height][width]
                guard char != " " else { continue }
                if board[height-1][width-1] == char && board[height-1][width] == char && board[height][width-1] == char {
                    matrix[height][width] = 1
                    matrix[height-1][width] = 1
                    matrix[height][width-1] = 1
                    matrix[height-1][width-1] = 1
                }
            }
        }
        
        for height in 0..<m {
            for width in 0..<n {
                if matrix[height][width] == 1 { board[height][width] = " " }
            }
        }
        
        for height in (1..<m).reversed() {
            for width in 0..<n {
                var compareHeight = height - 1
                while board[height][width] == " " {
                    guard compareHeight >= 0 else { break }
                    if board[compareHeight][width] == " " {
                        compareHeight -= 1
                        continue
                    } else {
                        board[height][width] = board[compareHeight][width]
                        board[compareHeight][width] = " "
                        break
                    }
                }
            }
        }
    } while matrix.reduce(0){ $0 + $1.reduce(0,+) } != 0
    
   
    
    return board.map{ $0.filter{$0 == " "}.count }.reduce(0, +)
}

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var boardArr = board
    var basket = [Int]()
    var result = 0
    
    for i in moves {
        let last = basket.last
        
        let pickCol = i-1
        var pickHeight = 0
        while boardArr[pickHeight][pickCol] == 0 { // find the height
            pickHeight += 1
            if pickHeight >= boardArr.count {break}
        }
        if pickHeight >= boardArr.count {continue} // if there is no doll
        
        let picked = boardArr[pickHeight][pickCol]
        boardArr[pickHeight][pickCol] = 0
        
        if last == picked {
            basket.removeLast()
            result += 2
        } else {
            basket.append(picked)
        }
    }
    
    return result
}

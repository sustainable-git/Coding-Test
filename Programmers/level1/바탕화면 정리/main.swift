import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
var minRow = wallpaper.count
    var minCol = wallpaper[0].count
    var maxRow = 0
    var maxCol = 0
    
    wallpaper.enumerated().forEach { (row, string) in
        string.enumerated().forEach { (col, value) in
            guard value == "#" else { return }
            minRow = min(minRow, row)
            minCol = min(minCol, col)
            maxRow = max(maxRow, row + 1)
            maxCol = max(maxCol, col + 1)
        }
    }
    
    return [minRow, minCol, maxRow, maxCol]
}

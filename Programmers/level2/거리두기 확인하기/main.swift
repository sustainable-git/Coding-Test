import Foundation

func ok(_ matrix: [[String]], _ height: Int, _ width: Int) -> Bool {
    guard matrix[height][width] == "P" else { return true }
    
    if height + 2 < 5 { if matrix[height + 2][width] == "P" && matrix[height + 1][width] != "X" { return false } }
    if width + 2 < 5 { if matrix[height][width + 2] == "P" && matrix[height][width + 1] != "X" { return false } }
    
    if height + 1 < 5 { if matrix[height + 1][width] == "P" { return false } }
    if width + 1 < 5 { if matrix[height][width + 1] == "P" { return false } }
    
    if height + 1 < 5 && width + 1 < 5 {
        if matrix[height + 1][width + 1] == "P" {
            if matrix[height + 1][width] != "X" || matrix[height][width + 1] != "X" { return false }
        }
    }
    
    if height + 1 < 5 && width - 1 >= 0 {
        if matrix[height + 1][width - 1] == "P" {
            if matrix[height + 1][width] != "X" || matrix[height][width - 1] != "X" { return false }
        }
    }
    
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
    for element in places {
        let matrix = element.map{ $0.map{ String($0) } }
        var zeroCheck = false
        
        for height in 0..<5 {
            guard !zeroCheck else { break }
            
            for width in 0..<5 {
                if ok(matrix, height, width) { continue }
                else { zeroCheck = true ; break }
            }
        }
        
        if zeroCheck { result += [0] }
        else { result += [1] }
    }
    
    return result
}


import Foundation

func solution(_ dirs:String) -> Int {
    var matrix = Array(repeating: Array(repeating: 0, count: 21), count: 21)
    var current = (10, 10)
    
    for i in dirs {
        let past = current
        
        switch i {
        case "U" : current.1 += 2 ; break
        case "D" : current.1 -= 2 ; break
        case "L" : current.0 -= 2 ; break
        case "R" : current.0 += 2 ; break
        default: break
        }
        if current.0 < 0 { current.0 = 0 } ; if current.0 > 20 { current.0 = 20 }
        if current.1 < 0 { current.1 = 0 } ; if current.1 > 20 { current.1 = 20 }
        guard current != past else { continue }
        
        matrix[(past.0 + current.0)/2][(past.1 + current.1)/2] = 1
    }
    
    return matrix.map{$0.reduce(0, +)}.reduce(0, +)
}


import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    guard m >= 1 else { fatalError() }
    
    var section = section.sorted(by: >)
    var count = 0
    
    while let firstSectionToPaint = section.last {
        defer { count += 1 }
        
        let lastSectionWillBePainted = firstSectionToPaint + m - 1
        while let checkPoint = section.last, checkPoint <= lastSectionWillBePainted {
            _ = section.popLast()
        }
    }
    
    return count
}

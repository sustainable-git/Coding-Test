import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var visited: Dictionary<Int, Int> = [:]
    var minimumNumberOfCalculate = Int.max
    
    func bt(loops: Int, currentValue: Int) {
        if currentValue == x {
            minimumNumberOfCalculate = min(minimumNumberOfCalculate, loops)
            return
        }
        guard currentValue > x else { return }
        if let numberOfCalculateBefore = visited[currentValue], numberOfCalculateBefore <= loops { return }
        visited[currentValue] = loops
        
        if currentValue % 3 == 0 { bt(loops: loops + 1, currentValue: currentValue / 3) }
        if currentValue % 2 == 0 { bt(loops: loops + 1, currentValue: currentValue / 2) }
        bt(loops: loops + 1, currentValue: currentValue - n)
    }
    
    bt(loops: 0, currentValue: y)
    
    return minimumNumberOfCalculate == Int.max ? -1 : minimumNumberOfCalculate
}

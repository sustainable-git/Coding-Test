import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result: Int = 0
    let count = dungeons.count
    dfs(depth: 0, max: count, fatigue: k, dungeons: dungeons, cleared: [], result: &result)
    
    return result
}

func dfs(depth: Int, max: Int, fatigue: Int, dungeons: [[Int]], cleared: [Int], result: inout Int) {
    guard depth <= max else { return }
    result = [result, depth].max()!
    for index in 0..<dungeons.count {
        if cleared.contains(index) { continue }
        let minFatigue = dungeons[index][0]
        let useFatigue = dungeons[index][1]
        guard fatigue >= minFatigue && fatigue >= useFatigue else { continue }
        dfs(depth: depth+1, max: max, fatigue: fatigue - useFatigue, dungeons: dungeons, cleared: cleared + [index], result: &result)
    }
}

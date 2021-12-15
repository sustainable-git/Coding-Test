import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var set: Set<[Int]> = []
    
    let map = banned_id.map{ bannedId in
        user_id.enumerated().filter { (index, id) -> Bool in
            return isMatched(id: id, pattern: bannedId)
        }.map{ $0.offset }
    }
    
    dfs(depth: 0, maxDepth: banned_id.count, visited: [], map: map, set: &set)
    
    return set.count
}

func dfs(depth: Int, maxDepth: Int, visited: Set<Int>, map: [[Int]], set: inout Set<[Int]>) {
    if depth == maxDepth {
        set.update(with: visited.sorted())
        return
    }
    
    for i in map[depth] {
        if visited.contains(i) {
            continue
        }
        var futureVisited = visited
        futureVisited.update(with: i)
        dfs(depth: depth+1, maxDepth: maxDepth, visited: futureVisited, map: map, set: &set)
    }
}


func isMatched(id: String, pattern: String) -> Bool {
    let regexString = "^" + pattern.replacingOccurrences(of: "*", with: "[a-zA-Z0-9]") + "$"
    let regex = try? NSRegularExpression(pattern: regexString)
    return regex?.firstMatch(in: id, options: [], range: NSRange(location: 0, length: id.count)) != nil
}

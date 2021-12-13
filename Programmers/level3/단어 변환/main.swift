import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result: Int = 100
    dfs(begin, target, words, [], &result)
    
    return result == 100 ? 0 : result
}

func dfs(_ begin: String, _ target: String, _ words: [String], _ used: [String], _ result: inout Int) {
    guard !used.contains(begin) && used.count != words.count else { return }
    if begin == target {
        result = min(result, used.count)
        return
    }
    
    var nextUsed = used
    nextUsed.append(begin)
    
    for word in words {
        if zip(begin, word).map{ $0 == $1 }.filter({ $0 == false }).count == 1 {
            dfs(word, target, words, nextUsed, &result)
        }
    }
}

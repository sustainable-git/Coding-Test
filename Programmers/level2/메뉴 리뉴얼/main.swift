import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var resultArray: [[String]] = []
    
    for number in course {
        let bests = bestCourse(orders: orders, n: number).filter{ $0.count > 0 }
        bests.count > 0 ? resultArray.append(bests) : Void()
    }
    
    return Array( resultArray.reduce([], +) ).sorted()
}

func bestCourse(orders: [String], n: Int) -> [String] {
    var menuToCalledNumber: [String: Int] = [:]
    
    orders.compactMap {
        course(of: $0, n: n)
    }.forEach { map in
        map.sorted().forEach {
            if let calledNumber = menuToCalledNumber[$0] {
                menuToCalledNumber[$0] = calledNumber + 1
            } else {
                menuToCalledNumber[$0] = 1
            }
        }
    }
    
    let maxNumber = menuToCalledNumber.map{ $0.value }.max()
    guard let max = maxNumber else { return [] }
    return max > 1 ? menuToCalledNumber.filter{ $0.value == max }.map { $0.key } : []
}

func course(of string: String, n: Int) -> [String]? {
    guard string.count >= n else { return nil }
    var result: [String] = []
    
    func dfs(depth: Int, head: Int, totalString: String, currentString: String) {
        if depth == currentString.count {
            result.append(String(currentString.sorted()))
            return
        }
        
        for index in head..<totalString.count {
            let character = totalString[totalString.index(totalString.startIndex, offsetBy: index)]
            dfs(depth: depth, head: index+1, totalString: totalString, currentString: currentString + String(character))
        }
    }
    dfs(depth: n, head: 0, totalString: string, currentString: "")
    
    return result
}

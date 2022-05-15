import Foundation

let LC = readLine()!.split(separator: " ").map { Int(String($0))! }
let characters = readLine()!.split(separator: " ").map { String($0) }

func solution(L: Int, characters: [String]) -> [String] {
    let charArr = characters.sorted()
    var resultArr: [String] = []
    
    func dfs(depth: Int, visited: String) {
        if visited.count == L {
            if visited.filter({ "aeiou".contains($0) }).count >= 1 &&
                visited.filter({ !"aeiou".contains($0) }).count >= 2 {
                resultArr.append(visited)
            }
            return
        }
        guard depth < characters.count else { return }
        
        dfs(depth: depth + 1, visited: visited + charArr[depth])
        dfs(depth: depth + 1, visited: visited)
    }
    
    dfs(depth: 0, visited: "")
    
    return resultArr
}

solution(L: LC[0], characters: characters).forEach {
    print($0)
}

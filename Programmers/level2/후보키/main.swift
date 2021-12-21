import Foundation

var CandidateKeyIndex: Set<[Int]> = []

func solution(_ relation:[[String]]) -> Int {
    let indexes = Array(relation[0].indices)

    let indexCombination = combination(of: indexes)
    for indexesElement in indexCombination {
        guard CandidateKeyIndex.allSatisfy ({!isPartOf($0, indexesElement)}) else { continue }

        var visitedKey: [Key] = []
        var flag: Bool = false
        let probableKey: [[String]] = relation.map { $0.enumerated().filter{ indexesElement.contains($0.0) }.map{$0.1} }
        for element in probableKey {
            let key = Key(element.reduce("",+))
            if visitedKey.contains(key){
                flag = true
                break
            }
            visitedKey.append(key)
        }
        if flag == false {
            CandidateKeyIndex.update(with: indexesElement)
        }
    }

    return CandidateKeyIndex.count
}

func isPartOf(_ A: [Int], _ B: [Int]) -> Bool {
    return A.allSatisfy({ B.contains($0) })
}

func combination(of indexes: [Int]) -> [[Int]] {
    var result: [[Int]] = []

    func dfs(depth: Int, max: Int, indexes: [Int], array: [Int], result: inout [[Int]]) {
        if depth == max {
            result.append(array)
            return
        }

        dfs(depth: depth + 1, max: max, indexes: indexes, array: array + [indexes[depth]], result: &result)
        dfs(depth: depth + 1, max: max, indexes: indexes, array: array, result: &result)
    }

    dfs(depth: 0, max: indexes.count, indexes: indexes, array: [], result: &result)

    return Array(result.sorted{ $0.count < $1.count }.dropFirst())
}

struct Key: Equatable{
    private let key: String

    init(_ key: String) {
        self.key = key
    }

    public static func ==(lhs: Key, rhs: Key) -> Bool {
        return lhs.key == rhs.key
    }
}

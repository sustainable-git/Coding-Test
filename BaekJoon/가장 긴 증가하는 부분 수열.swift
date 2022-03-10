import Foundation

_ = readLine()!
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

func solution(arr: [Int]) -> Int {
    var stored: [(Int, Int)] = []
    arr.forEach { number in
        if let lastMaximum = stored.filter({ $0.0 < number }).map({ $0.1 }).max() {
            stored.append((number, lastMaximum + 1))
        } else {
            stored.append((number, 1))
        }
    }
    
    return stored.map { $0.1 }.max()!
}

print(solution(arr: arr))

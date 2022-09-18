let N = Int(readLine()!)!
var points: [(Int, Int)] = []
(0..<N).forEach { _ in
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    points.append((input[0], input[1]))
}

func solution(points: [(Int, Int)]) -> [(Int, Int)] {
    return points.sorted {
        if $0.0 < $1.0 {
            return true
        } else if $0.0 == $1.0 {
            return $0.1 < $1.1
        } else {
            return false
        }
    }
}

solution(points: points).forEach {
    print($0.0, $0.1)
}

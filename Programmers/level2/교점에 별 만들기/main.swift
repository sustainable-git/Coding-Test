import Foundation

func solution(_ line:[[Int]]) -> [String] {
    let points = pointsOf(line)
    return points.starMaker()
}

func pointsOf(_ line: [[Int]]) -> Points {
    var points: [Point] = []
    for index1 in 0..<line.count {
        for index2 in 0..<line.count {
            guard index1 < index2,
                  let point = intersection(line[index1], line[index2]) else { continue }
            points.append(point)
        }
    }
    return Points(points)
}


func intersection(_ left: [Int], _ right: [Int]) -> Point? {
    guard left.count == 3 && right.count == 3 else { exit(-1) }
    let a = left[0]; let b = left[1]; let e = left[2]
    let c = right[0]; let d = right[1]; let f = right[2]
    let denominator = a * d - b * c
    let parallel = a * d - b * c
    guard parallel != 0, denominator != 0 else { return nil }
    let x = Double(b * f - e * d) / Double(denominator)
    let y = Double(e * c - a * f) / Double(denominator)
    guard x == ceil(x) && y == ceil(y) else { return nil }
    return Point(x: Int(x), y: Int(y))
}

struct Point: Hashable {
    let x: Int
    let y: Int
}

struct Points: CustomStringConvertible {
    var description: String {
        points.map { "(\($0.x), \($0.y))" }.joined(separator: " ")
    }
    
    private var points: Set<Point> = []
    private var minX: Int { return points.sorted{ $0.x < $1.x }.first!.x }
    private var maxX: Int { return points.sorted{ $0.x < $1.x }.last!.x }
    private var minY: Int { return points.sorted{ $0.y < $1.y }.first!.y }
    private var maxY: Int { return points.sorted{ $0.y < $1.y }.last!.y }
    private var width: Int { return self.maxX - self.minX + 1 }
    private var height: Int { return self.maxY - self.minY + 1 }
    
    init(_ points: [Point]) {
        points.forEach {
            self.points.update(with: $0)
        }
    }
    
    func starMaker() -> [String] {
        var matrix: [[String]] = Array(repeating: Array(repeating: ".", count: width), count: height)
        points.forEach{
            let x = $0.x - minX
            let y = $0.y - minY
            matrix[height - y - 1][x] = "*"
        }
        
        return matrix.map { $0.joined() }
    }
}

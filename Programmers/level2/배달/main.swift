import Foundation

var minTimeDict: [Node: Int] = [:]

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var visitableNodes: Set<Node> = []
    let nodes = (1...N).map{ Node(number: $0) }
    
    for element in road {
        let firstNode = nodes[element[0]-1]
        let secondNode = nodes[element[1]-1]
        let time = element[2]
        firstNode.addNeighbor(secondNode, time: time)
        secondNode.addNeighbor(firstNode, time: time)
    }
    
    BruteForce(node: nodes[0], consumedTime: 0, timeLimit: k, visited: [nodes[0]], visitableNodes: &visitableNodes)
    
    return visitableNodes.count
}

func BruteForce(node: Node, consumedTime: Int, timeLimit: Int, visited: Set<Node>, visitableNodes: inout Set<Node>) {
    visitableNodes.update(with: node)
    minTimeDict.updateValue(consumedTime, forKey: node)
    
    node.neighbors.forEach { neighborNode in
        guard !visited.contains(neighborNode) else { return }
        guard let requiredTime = node.requiredTime(to: neighborNode) else { return }
        
        if let pastExperiencedMinTime = minTimeDict[neighborNode],
           consumedTime + requiredTime >= pastExperiencedMinTime {
            return
        }
        
        if consumedTime + requiredTime <= timeLimit {
            var willhaveVisited = visited
            willhaveVisited.update(with: neighborNode)
            BruteForce(
                node: neighborNode,
                consumedTime: consumedTime + requiredTime,
                timeLimit: timeLimit,
                visited: willhaveVisited,
                visitableNodes: &visitableNodes
            )
        }
    }
}

class Node: CustomStringConvertible{
    var description: String {
        return "\(number)"
    }
    private var number: Int
    private var neighborNodeTimeDict: [Node: Int] = [:]
    var neighbors: [Node] {
        get { neighborNodeTimeDict.map{ $0.key } }
    }
    
    init(number: Int) {
        self.number = number
    }
    
    func addNeighbor(_ node: Node, time: Int) {
        if let anotherTime = neighborNodeTimeDict[node] {
            let minTime = min(time, anotherTime)
            self.neighborNodeTimeDict.updateValue(minTime, forKey: node)
        } else {
            self.neighborNodeTimeDict.updateValue(time, forKey: node)
        }
    }
    
    func requiredTime(to: Node) -> Int? {
        return neighborNodeTimeDict[to]
    }
}

extension Node: Hashable{
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.number == rhs.number
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
}

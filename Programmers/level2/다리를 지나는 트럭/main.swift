import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var arr = truck_weights.reversed().map{$0}
    var bridge = [(Int, Int)]()
    var time = 0

    while arr.count > 0 || bridge.count > 0 {
        time += 1

        if arr.count > 0 && bridge.map{$0.0}.reduce(0, +) + arr.last! <= weight  {
            bridge.append((arr.popLast()!, 0))
        }

        for i in 0..<bridge.count { bridge[i].1 += 1 }
        while bridge.count > 0 && bridge.first!.1 >= bridge_length { bridge.removeFirst() }
    }

    return time + 1
}
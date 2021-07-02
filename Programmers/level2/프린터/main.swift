import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var arr = [(Int, Int)]()
    var count = 0

    for (index, value) in priorities.enumerated() { arr.append((index, value)) }

    for _ in 0..<arr.count {
        let highest = arr.map{$0.1}.max()!

        while true {
            let index : Int
            let value : Int
            (index, value) = arr.first!

            if value == highest && index == location {
                count += 1
                return count
            } else if value == highest {
                count += 1
                arr.removeFirst()
                break
            } else {
                arr.append(arr.removeFirst())
            }
        }
    }

    return -1
}
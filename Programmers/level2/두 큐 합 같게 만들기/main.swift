import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let totalNumberOfQueue = queue1.count + queue2.count
    var queue1 = queue1
    var queue2 = queue2
    var sumOfQueue1 = queue1.reduce(0, +)
    var sumOfQueue2 = queue2.reduce(0, +)
    let totalSum = sumOfQueue1 + sumOfQueue2
    guard totalSum % 2 == 0 else { return -1 }
    var count = 0

    var queue1Head = 0
    var queue2Head = 0
    while count <= totalNumberOfQueue * 2 {
        if sumOfQueue1 == sumOfQueue2 { return count }
        
        if sumOfQueue1 > sumOfQueue2 {
            defer { queue1Head += 1 }
            let number = queue1[queue1Head]
            sumOfQueue1 -= number
            sumOfQueue2 += number
            queue2.append(number)
        } else {
            defer { queue2Head += 1 }
            let number = queue2[queue2Head]
            sumOfQueue2 -= number
            sumOfQueue1 += number
            queue1.append(number)
        }
        count += 1
    }
    
    return -1
}

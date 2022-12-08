import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var maxHeap = MaxHeap()
    var defendedRounds: Int = 0
    var numberOfSoldiers: Int = n
    var numberOfGodModes: Int = k

    for numberOfEnemiesThisRound in enemy {
        if numberOfSoldiers >= numberOfEnemiesThisRound {
            defendedRounds += 1
            numberOfSoldiers -= numberOfEnemiesThisRound
            maxHeap.append(numberOfEnemiesThisRound)
        } else if numberOfGodModes > 0 {
            defendedRounds += 1
            numberOfGodModes -= 1
            maxHeap.append(numberOfEnemiesThisRound)
            numberOfSoldiers += maxHeap.pop() - numberOfEnemiesThisRound
        } else {
            break
        }
    }

    return defendedRounds
}

struct MaxHeap {
    private var array: [Int] = []

    mutating func append(_ element: Int) {
        var index = array.count
        array.append(element)
        while (index - 1) / 2 >= 0, array[(index - 1) / 2] < array[index] {
            let temp = array[(index - 1) / 2]
            array[(index - 1) / 2] = array[index]
            array[index] = temp
            index = (index - 1) / 2
        }
    }

    mutating func pop() -> Int {
        let numberWillBePoped = array.first!
        var index = 0
        array[index] = array.last!
        _ = array.popLast()
        while index * 2 + 1 < array.count {
            if index * 2 + 2 < array.count {
                var biggerChildIndex = 0
                if array[index * 2 + 1] < array[index * 2 + 2] {
                    biggerChildIndex = index * 2 + 2
                } else {
                    biggerChildIndex = index * 2 + 1
                }
                if array[index] < array[biggerChildIndex] {
                    let temp = array[biggerChildIndex]
                    array[biggerChildIndex] = array[index]
                    array[index] = temp
                    index = biggerChildIndex
                } else {
                    break
                }
            } else {
                if array[index * 2 + 1] > array[index] {
                    let temp = array[index * 2 + 1]
                    array[index * 2 + 1] = array[index]
                    array[index] = temp
                    index = index * 2 + 1
                } else {
                    break
                }
            }
        }

        return numberWillBePoped
    }
}

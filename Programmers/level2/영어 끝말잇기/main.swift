import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var last = words[0].first
    var checked = [String]()

    var number = 0
    var order = 0

    for i in words {
        if checked.contains(i) { return [number + 1, order + 1] }
        else { checked.append(i) }

        if i.first == last { number += 1 }
        else { return [number + 1, order + 1] }

        last = i.last

        if number % n == 0 { number = 0 ; order += 1 }
    }

    return [0, 0]
}

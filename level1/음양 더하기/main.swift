import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result : Int = 0

    for (index, value) in absolutes.enumerated() {
        if signs[index] == true { result += value }
        else { result -= value }
    }

    return result
}

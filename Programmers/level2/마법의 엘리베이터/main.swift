import Foundation

func solution(_ storey:Int) -> Int {
    var result = 0
    var add = 0
    let stories = String(storey).map{ Int(String($0))! }
    for index in 0..<stories.count {
        var number = stories[index]
        if number == 9 && add == 1 {
            add = 1
            continue
        } else {
            number += add
            add = 0
        }
        if number <= 4 {
            result += number
            continue
        }
        if number >= 6 {
            result += 10 - number
            add = 1
            continue
        }
        if index == stories.count - 1 {
            result += number
        } else {
            let nextNumber = stories[index + 1]
            if nextNumber >= 5 {
                result += 5
                add = 1
            } else {
                result += 5
                add = 0
            }
        }
    }
    
    return result + add
}

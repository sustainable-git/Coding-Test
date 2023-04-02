import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    let numberOfWantDictionary = Dictionary(uniqueKeysWithValues: zip(want, number))
    var discountDictionary = discount[0..<9].reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var count = 0
    
    for today in 9..<discount.count {
        defer {
            let passedDay = today - 9
            let deletingStuff = discount[passedDay]
            discountDictionary[deletingStuff, default: 0] -= 1
        }
        let addingStuff = discount[today]
        discountDictionary[addingStuff, default: 0] += 1
        if isDayJunghyunWant(numberOfWantDictionary: numberOfWantDictionary, discountDictionary: discountDictionary) {
            count += 1
        }
    }
    
    return count
}

func isDayJunghyunWant(numberOfWantDictionary dict: [String: Int], discountDictionary: [String: Int]) -> Bool {
    for element in dict {
        guard let numberOfDiscounts = discountDictionary[element.key] else { return false }
        guard numberOfDiscounts >= element.value else { return false }
    }
    return true
}

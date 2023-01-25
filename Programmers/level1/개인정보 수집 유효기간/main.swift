import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termDictionary: Dictionary<String, String> = [:]
    terms.forEach { term in
        let elements = term.split(separator: " ").map{ String($0) }
        termDictionary.updateValue(elements[1], forKey: elements[0])
    }
    
    return privacies.enumerated().compactMap { (index, privacy) in
        let targetDate = privacy.split(separator: " ").map { String($0) }[0]
        let term = privacy.split(separator: " ").map { String($0) }[1]
        let targetDueDate = dueDate(of: targetDate, term: term, termDictionary: termDictionary)
        
        return isExpired(today: today, targetDate: targetDueDate) ? index + 1 : nil
    }
}

func dueDate(of date: String, term: String, termDictionary: Dictionary<String, String>) -> String {
    let monthsToIncrement: Int = Int(termDictionary[term]!)!
    let dates = date.split(separator: ".").map { Int(String($0))! }
    var year = dates[0]
    var month = dates[1]
    let day = dates[2]
    
    month = month + monthsToIncrement
    while month > 12 {
        month -= 12
        year += 1
    } 
    
    return "\(year).\(String(format: "%02d", month)).\(String(format: "%02d", day))"
}

func isExpired(today: String, targetDate: String) -> Bool {
    let targetDates = targetDate.split(separator: ".").map{ String($0) }
    let todayDates = today.split(separator: ".").map{ String($0)}
    if todayDates[0] > targetDates[0] { return true }
    if todayDates[0] == targetDates[0], todayDates[1] > targetDates[1] { return true }
    if todayDates[0] == targetDates[0], todayDates[1] == targetDates[1], todayDates[2] >= targetDates[2] { return true }
    return false
}

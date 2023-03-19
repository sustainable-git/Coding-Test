import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var firstStack: [String] = cards1.reversed()
    var secondStack: [String] = cards2.reversed()
    var goalStack: [String] = goal.reversed()
    var result: Bool = false
    
    func bt(firstStack: [String], secondStack: [String], leftGoalStack: [String]) {
        guard let word = leftGoalStack.last else { result = true; return }
        
        if let wordOfFirstStack = firstStack.last, wordOfFirstStack == word {
            bt(firstStack: firstStack.dropLast(), secondStack: secondStack, leftGoalStack: leftGoalStack.dropLast())
        }
        
        if let wordOfSecondStack = secondStack.last, wordOfSecondStack == word {
            bt(firstStack: firstStack, secondStack: secondStack.dropLast(), leftGoalStack: leftGoalStack.dropLast())
        }
    }
    bt(firstStack: firstStack, secondStack: secondStack, leftGoalStack: goalStack)
    
    return result ? "Yes" : "No"
}

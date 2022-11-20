import Foundation

func solution(_ food:[Int]) -> String {
    let foodString = food.enumerated().map{ String(repeating: String($0.offset), count: $0.element / 2) }.dropFirst().reduce("", +)
    return foodString + "0" + String(foodString.reversed())
}

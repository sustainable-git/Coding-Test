import Foundation

func solution(_ topping:[Int]) -> Int {
    guard topping.count > 1 else { return 0 }
    var leftRollCakePiece = RollCakePiece()
    var rightRollCakePiece = RollCakePiece()
    var leftIndex = 0
    var rightIndex = topping.count - 1
    
    while leftIndex <= rightIndex {
        if leftRollCakePiece.numberOfToppingKinds <= rightRollCakePiece.numberOfToppingKinds {
            leftRollCakePiece.addPiece(ofTopping: topping[leftIndex])
            leftIndex += 1
        } else {
            rightRollCakePiece.addPiece(ofTopping: topping[rightIndex])
            rightIndex -= 1
        }
    }
    leftIndex -= 1
    if leftRollCakePiece.numberOfToppingKinds == rightRollCakePiece.numberOfToppingKinds + 1 {
        leftRollCakePiece.removePiece(ofTopping: topping[leftIndex])
        rightRollCakePiece.addPiece(ofTopping: topping[leftIndex])
        leftIndex -= 1
    }
    
    var result = 0
    while leftRollCakePiece.numberOfToppingKinds == rightRollCakePiece.numberOfToppingKinds {
        result += 1
        leftRollCakePiece.removePiece(ofTopping: topping[leftIndex])
        rightRollCakePiece.addPiece(ofTopping: topping[leftIndex])
        leftIndex -= 1
    }
    
    return result
}

struct RollCakePiece {
    private var toppingKinds: Dictionary<Int, Int> = [:]
    var numberOfToppingKinds: Int {
        return toppingKinds.count
    }
    
    mutating func addPiece(ofTopping topping: Int) {
        toppingKinds[topping, default: 0] += 1
    }
    
    mutating func removePiece(ofTopping topping: Int) {
        guard toppingKinds[topping] != nil else { fatalError() }
        toppingKinds[topping]! -= 1
        if toppingKinds[topping] == 0 { toppingKinds[topping] = nil }
    }
}

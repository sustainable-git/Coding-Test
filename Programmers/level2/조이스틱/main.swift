import Foundation

func solution(_ name:String) -> Int {
    guard name != String(repeating: "A", count: name.count) else  { return 0 }
    var minCount: Int = Int.max
    
    func btFront(head: String.Index, current: String, count: Int, turn: Bool) {
        if count > minCount { return }
        var newCount = count
        var newCurrent = current
        if current[head] != name[head] {
            newCurrent.remove(at: head)
            newCurrent.insert(name[head], at: head)
            newCount += numberOfJoystickMoves(of: name[head])
            if newCurrent == name { minCount = min(minCount, newCount); return }
        }
        btFront(head: name.circularIndex(after: head), current: newCurrent, count: newCount + 1, turn: turn)
        if !turn {
            btBackward(head: name.circularIndex(before: head), current: newCurrent, count: newCount + 1, turn: true)
        }
    }
    
    func btBackward(head: String.Index, current: String, count: Int, turn: Bool) {
        if count > minCount { return }
        var newCount = count
        var newCurrent = current
        if current[head] != name[head] {
            newCurrent.remove(at: head)
            newCurrent.insert(name[head], at: head)
            newCount += numberOfJoystickMoves(of: name[head])
            if newCurrent == name { minCount = min(minCount, newCount); return }
        }
        btBackward(head: name.circularIndex(before: head), current: newCurrent, count: newCount + 1, turn: turn)
        if !turn {
            btFront(head: name.circularIndex(after: head), current: newCurrent, count: newCount + 1, turn: true)
        }
    }
    btFront(head: name.startIndex, current: String(repeating: "A", count: name.count), count: 0, turn: false)
    btBackward(head: name.startIndex, current: String(repeating: "A", count: name.count), count: 0, turn: false)
    
    return minCount
}

func numberOfJoystickMoves(of char: Character) -> Int {
    let alphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let up = alphabet.distance(from: alphabet.startIndex, to: alphabet.firstIndex(of: char)!)
    let down = abs(alphabet.distance(from: alphabet.endIndex, to: alphabet.firstIndex(of: char)!))
    return min(up, down)
}

extension String {
    func circularIndex(after index: String.Index) -> String.Index {
        return index == self.index(before: endIndex) ? self.startIndex : self.index(after: index)
    }
    
    func circularIndex(before index: String.Index) -> String.Index {
        return index == self.startIndex ? self.index(before: endIndex) : self.index(before: index)
    }
}

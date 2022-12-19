import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var countertop = HamburgerStack()
    ingredient.forEach {
        countertop.append(element: $0)
    }
    return countertop.count
}

struct HamburgerStack {
    private var stack: [Int] = []
    private(set) var count: Int = 0
    
    mutating func append(element: Int) {
        stack.append(element)
        makeHambergurIfPossible()
    }
    
    mutating func makeHambergurIfPossible() {
        while stack.count >= 4, stack[stack.count-4..<stack.count] == [1,2,3,1] {
            stack.removeLast(4)
            count += 1
        }
    }
}

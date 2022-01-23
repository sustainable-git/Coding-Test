import Foundation

class Difference {
    private var elements = [Int]()
    var maximumDifference: Int
    // Write your code here
        init(a: [Int]) {
        self.elements = a.sorted(by: <)
        self.maximumDifference = 0
    }
    
    func computeDifference() {
        self.maximumDifference = abs(elements.last! - elements.first!)
    }
} // End of Difference class

let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let d = Difference(a: a)

d.computeDifference()

print(d.maximumDifference)

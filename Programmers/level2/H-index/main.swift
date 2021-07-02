import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedArr = citations.sorted(by: >)

    for i in (0...sortedArr.first!).reversed() {
        let above = sortedArr.filter{$0 >= i}
        let below = sortedArr.filter{$0 < i}

        if above.count >= i  && below.count <= i {
            return i
        }
    }
    return 0
}

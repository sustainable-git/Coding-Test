import Foundation

func solution(_ s:String) -> [Int] {
    var sCopy = s
    var trans = 0
    var zero = 0

    while sCopy != "1" {
        zero += sCopy.filter{$0 == "0"}.count
        sCopy = sCopy.filter{$0 == "1"}
        sCopy = String(sCopy.count, radix: 2)
        trans += 1
    }

    return [trans, zero]
}

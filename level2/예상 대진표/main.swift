import Foundation

func halfCeil(_ n : Int) -> Int {
    return Int(ceil(Double(n)/2))
}

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var count = 1
    var greater = a > b ? a : b
    var less = a < b ? a : b

    while !(less % 2 == 1 && less + 1 == greater) {
        less = halfCeil(less)
        greater = halfCeil(greater)
        count += 1
    }

    return count
}

func solution2(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var aCopy = a
    var bCopy = b
    var count = 0
    
    while aCopy != bCopy {
        aCopy = (aCopy + 1) / 2
        bCopy = (bCopy + 1) / 2
        count += 1
    }

    return count
}

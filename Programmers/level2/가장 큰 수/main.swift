import Foundation

func bigger(_ n1 : String, _ n2 : String) -> Bool {
    return n1 + n2 > n2 + n1
}

func solution(_ numbers:[Int]) -> String {
    let result = numbers.map{String($0)}.sorted{bigger($0, $1)}.joined()
    return Int(result) == 0 ? "0" : result
}

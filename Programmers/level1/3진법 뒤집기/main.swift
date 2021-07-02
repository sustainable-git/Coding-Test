import Foundation

func solution(_ n:Int) -> Int {
    let number = String(n, radix: 3).reversed()
    return Int(String(number), radix: 3)!
}

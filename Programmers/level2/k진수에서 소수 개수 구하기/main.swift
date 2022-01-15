import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let map = String(n, radix: k, uppercase: false).split(separator: "0")
    
    return map.filter{ isPrime(Int($0)!) }.count
}

func isPrime(_ n : Int) -> Bool {
    if n <= 1 { return false }
    else if n == 2 || n == 3 { return true }
    else {
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
        return true
    }
}

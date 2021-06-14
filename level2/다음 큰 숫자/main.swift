import Foundation

func solution(_ n:Int) -> Int{

    func counter(_ n: Int) -> Int {
        let count : Int = String(n, radix: 2).reduce(0){
            return $1 == "1" ? $0 + Int(String($1))! : $0
            }
        return count
    }

    let count = counter(n)
    var result = n + 1

    while true {
        if counter(result) == count { return result }
        else { result += 1 }
    }
}

func solution(_ n:Int64) -> Int64 {
    var arr = [Int]()
    var result = 0
    var counter = 1
    
    for i in String(n) {
        arr.append(Int(String(i))!)
    }
    arr.sort{$0 < $1}
    
    while arr.count > 0 {
        result += arr.popLast()! * counter
        counter *= 10
    }
    
    return Int64(result)
}

func solution2(_ n:Int64) -> Int64 {
    return Int64(String(Array(String(n)).sorted{ $0 > $1 }))!
}

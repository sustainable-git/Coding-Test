func solution(_ n:Int64) -> [Int] {
    let arr = Array(String(n)).reversed()
    var result = [Int]()
    for i in arr {
        result.append(Int(String(i))!)
    }
    return result
}

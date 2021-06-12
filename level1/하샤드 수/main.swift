func solution(_ x:Int) -> Bool {
    let a : Int = Array(String(x)).reduce(0){return Int(String($0))! + Int(String($1))!}
    return x % a == 0 ? true : false
}

func solution2(_ x:Int) -> Bool {
    let a : Int = String(x).reduce(0){$0 + Int(String($1))!}
    return x % a == 0 ? true : false
}
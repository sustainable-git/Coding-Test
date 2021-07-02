func gcd(_ a: Int, _ b: Int) -> Int {
    let mod = a % b
    return mod == 0 ? b : gcd(b, mod)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ arr:[Int]) -> Int {
    var result = 1
    for i in arr {
        result = lcm(result, i)
    }
    return result
}

func solution2(_ arr:[Int]) -> Int {
    return arr.reduce(1){lcm($0, $1)}
}
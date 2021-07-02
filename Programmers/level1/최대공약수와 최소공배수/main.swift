func solution(_ n:Int, _ m:Int) -> [Int] {
    let small = n > m ? m : n
    let big = n > m ? n : m

    var commonDivisor = 1
    var commonMultiple = 1

    for i in (1...n).reversed() { // commonDivisor
        if n % i == 0 && m % i == 0 {
            commonDivisor = i
            break
        }
    }

    for i in (1...n) { // commonMultiple
        if m * i % n == 0 {
            commonMultiple = m * i
            break
        }
    }

    return [commonDivisor, commonMultiple]
}

func solution2(_ n:Int, _ m:Int) -> [Int] {
    
    func gcd(_ a : Int, _ b : Int) -> Int {
       let mod = a % b
        return mod == 0 ? min(a, b) : gcd(b, mod)
    }

    func lcm(_ a : Int, _ b : Int) -> Int {
        return a * b / gcd(a, b)
    }
    
    return [gcd(n, m), lcm(n, m)]
}
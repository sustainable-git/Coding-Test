func solution(_ n:Int) -> Int {
    var fibo = Array(repeating: 0, count: 100001)
    fibo[1] = 1
    fibo[2] = 1

    func makeFibo(_ n: Int) -> Int {
        if fibo[n] != 0 { return fibo[n] }
        else {
            fibo[n] = (makeFibo(n-1) + makeFibo(n-2)) % 1234567
            return fibo[n]
        }
    }
    return makeFibo(n) % 1234567
}

func solution2(_ n:Int) -> Int {
    var fibo = Array(repeating: 0, count: n+1)
    fibo[1] = 1
    for i in 2...n {
        fibo[i] = (fibo[i-1] + fibo[i-2]) % 1234567
    }
    return fibo[n]
}
var a: [Int] = [0, 1, 2]

func solution(_ n:Int) -> Int {
    if n <= a.count { return n }
    for index in 3...n {
        makeArray(of: index)
    }
    
    return a[n]
}

func makeArray(of n: Int) {
    a.append((a[n-1] + a[n-2]) % 1234567)
}

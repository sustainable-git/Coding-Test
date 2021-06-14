import Foundation

func isPrime(_ n : Int) -> Bool {
    if n == 0 || n == 1 { return false }
    else if n == 2 || n == 3 { return true }
    else if n % 2 == 0 { return false }
    else {
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
        return true
    }
}

func solution(_ numbers:String) -> Int {
    let nArr = Array(numbers).map{Int(String($0))!}
    var parityArr = Array(repeating: 0, count: numbers.count)
    var resultSet = Set<Int>()
    var onProgress = [Int]()

    func dfs(_ depth : Int, _ count : Int) -> Void {
        if depth == count {
            let value = onProgress.reduce(0){$0*10 + $1}
            if isPrime(value) {
                resultSet.insert(value)
            }
        }
        else {
            for i in 0..<nArr.count {
                guard parityArr[i] == 0 else { continue }
                parityArr[i] = 1
                onProgress.append(nArr[i])
                dfs(depth + 1, count)
                parityArr[i] = 0
                onProgress.removeLast()
            }
        }
    }

    for i in 1...nArr.count {
        dfs(0, i)
    }

    return resultSet.count
}

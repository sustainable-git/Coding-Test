import Foundation

func solution(n: Int) -> [String] {
    if n == 1 {
        return ["*"]
    }

    let starArr = solution(n: n/3)
    var arr = [String]()
    for stars in starArr {
        arr += [String(repeating: stars, count: 3)]
    }
    for stars in starArr {
        arr += [stars + String(repeating: " ", count: n/3) + stars]
    }
    for stars in starArr {
        arr += [String(repeating: stars, count: 3)]
    }

    return arr
}

solution(n: Int(readLine()!)!).forEach {
    print($0)
}

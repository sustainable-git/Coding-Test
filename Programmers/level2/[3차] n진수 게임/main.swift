func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {

    var result = ""
    var numArr = [String]()
    var count = 0
    var index = 0

    for i in 0...m*t {
        for j in String(i, radix: n) {
            numArr.append(String(j).uppercased())
        }
    }

    while count < t {
        if index % m == p - 1 {
            result += numArr[index]
            count += 1
        }
        index += 1
    }

    return result
}

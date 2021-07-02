import Foundation

func compacter(_ n : Int, _ s : String) -> String {
    let arr = Array(s)
    var count = 1
    var pre = ""
    var current = ""
    var result = ""

    for i in arr {
        current += String(i)
        guard current.count == n else { continue } // n개 이상이 되도록 현재값을 계속 넣어준다

        if pre == current { count += 1 ; current = "" } // current 초기화
        else {
            if count != 1 { result += String(count) ; count = 1 } // count에 값이 들어가있으면, 먼저 result에 넣는다
            result += pre // result에 pre를 넣어준다
            pre = current // pre에 current 값을 넣어준다
            current = ""
        }
    }

    // 남은 값 처리
    if count != 1 { result += String(count) }
    result += pre
    if current.count != 0 { result += current }

    return result
}

func solution(_ s:String) -> Int {
    if s.count == 1 { return 1 }

    // 1개 부터 s.count/2개 까지 압축되는지 확인해야함
    var count = [Int]()

    for i in 1...s.count/2 {
        count.append(compacter(i, s).count)
    }

    return count.min()!
}
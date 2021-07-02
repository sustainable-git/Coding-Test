import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    var onProgress = [Int]()

    func dfs(_ depth : Int, _ count : Int) -> Void {
        if depth == count {
            guard onProgress.reduce(0, +) == target else { return }
            result += 1
        } else {
            onProgress.append(numbers[depth])
            dfs(depth + 1, count)

            onProgress.removeLast()

            onProgress.append(-numbers[depth])
            dfs(depth + 1, count)

            onProgress.removeLast()
        }
    }

    dfs(0, numbers.count)

    return result
}

/* ------------------------------------ */

func dfs(_ numbers : [Int], _ target : Int, _ depth : Int, _ sum : Int, _ result : inout Int) {
    if depth == numbers.count {
        guard sum == target else { return }
        result += 1 ; return
    } else {
        dfs(numbers, target, depth + 1, sum + numbers[depth], &result)
        dfs(numbers, target, depth + 1, sum - numbers[depth], &result)
    }
}

func solution2(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    dfs(numbers, target, 0, 0, &result)
    
    return result
}



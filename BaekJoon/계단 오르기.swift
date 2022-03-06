import Foundation

// sum(n) 의 최댓값 = f(n) + sum(n-2) or f(n) + f(n-1) + sum(n-3)

let totalSteps = Int(readLine()!)!

var steps: [Int] = []
(1...totalSteps).forEach { _ in
    steps.append(Int(readLine()!)!)
}

var maxSumOfStep: [Int] = []

func solution() -> Int {
    if steps.count == 1 {
        return steps[0]
    } else if steps.count == 2 {
        return steps[0] + steps[1]
    } else if steps.count == 3 {
        return max(steps[0] + steps[2], steps[1] + steps[2])
    } else {
        let initials = [steps[0], steps[0] + steps[1], max(steps[0] + steps[2], steps[1] + steps[2])]
        maxSumOfStep += initials
        (4...steps.count).forEach {
            let next = max(maxSumOfStep[$0 - 3], steps[$0 - 2] + maxSumOfStep[$0 - 4]) + steps[$0 - 1]
            maxSumOfStep.append(next)
        }
        return maxSumOfStep.last!
    }
}

print(solution())


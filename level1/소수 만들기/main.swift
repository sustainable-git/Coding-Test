import Foundation

func isPrime(N : Int) ->  Bool {
    if N == 1 { return false }
    else if N == 2 { return true }
    else if N % 2 == 0 { return false }
    
    for i in stride(from: 3, through: Int(sqrt(Double(N))), by: 2){
        if N % i == 0 { return false }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var count = 0
    
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                if isPrime(N: nums[i] + nums[j] + nums[k]) == true {
                    count += 1
                }
            }
        }
    }
    return count
}

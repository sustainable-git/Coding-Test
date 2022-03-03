import Foundation

let N = Int(readLine()!)!

func solution(N: Int) -> Int {
    if N == 3 { return 1 }
    if N == 4 { return -1 }
    
    var five: Int = N / 5
    var three: Int = (N - five * 5) / 3
    var result: Int {
        return three + five
    }
    var left: Int = N - five * 5 - three * 3
    
    while left > 0 && five > 0 {
        five -= 1
        left += 5
        three += left/3
        left -= left/3 * 3
    }
    
    return five >= 0 && left == 0 ? result : -1
}

print(solution(N: N))

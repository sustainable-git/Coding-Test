import Foundation

func solution(N: Int) -> Int {
    var n = N
    var count = 0
    var result = 0
    
    while n != 0 {
        defer { n /= 10 }
        count += 1
    }
    
    var base = count
    while base != 0 {
        defer { base -= 1 }
        result += ( Int(pow(10.0, Double(base - 1))) - Int(pow(10.0, Double(base - 2))) ) * (base - 1)
    }
    result += (N + 1 - Int(pow(10.0, Double(count - 1)))) * (count)
    
    return result
}

print(solution(N: Int(readLine()!)!))

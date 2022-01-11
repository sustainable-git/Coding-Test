import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var max: Int = 9
    
    func dp(count: Int, num: Int) {
        if num == number { max = count; return }
        
        var NN = 0
        for i in 0..<8 {
            guard count + i < max else { return }
            NN = NN * 10 + N
            dp(count: count + i + 1, num: num + NN)
            dp(count: count + i + 1, num: num - NN)
            dp(count: count + i + 1, num: num * NN)
            dp(count: count + i + 1, num: num / NN)
        }
    }
    
    dp(count: 0, num: 0)
    
    return max == 9 ? -1 : max
}

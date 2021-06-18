import Foundation


func solution(_ numbers:[Int64]) -> [Int64] {
    var resultArr = [Int64]()
    
    for n in numbers {
        if n % 2 == 0 { // 짝수
            resultArr.append(n+1)
        } else { // 홀수
            var shiftBit : Int64 = 1
            while shiftBit & n != 0 {
                shiftBit = shiftBit << 1
            }
            resultArr.append(n+shiftBit/2)
        }
    }
    
    return resultArr
}

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    let noClothes = lost.filter{!reserve.contains($0)}
    var clothes = reserve.filter{!lost.contains($0)}
    
    var result = n - noClothes.count
    
    for i in noClothes {
        for j in 0..<clothes.count {
            if i == clothes[j] - 1 || i == clothes[j] + 1 {
                clothes[j] = -1
                result += 1
                break
            }
        }
    }
    return result
}

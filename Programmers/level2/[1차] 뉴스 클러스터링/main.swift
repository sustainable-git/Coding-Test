import Foundation

func J(_ str1 : [String], _ str2 : [String]) -> Int {
    let total = str1.count + str2.count
    var checked = Array(repeating : 0, count : str2.count)

    for (index1, value1) in str1.enumerated() {
        for (index2, value2) in str2.enumerated() {
            guard checked[index2] == 0 else { continue }          
            if value1 == value2 {
                checked[index2] = 1
                break
            }
        }
    }
    let same = checked.filter{$0 == 1}.count

    return total == 0 ? 65536 : same * 65536 / (total - same)
}

func solution(_ str1:String, _ str2:String) -> Int {

    let arr1 = (0..<str1.count - 1).map{String(Array(str1)[$0...$0+1]).lowercased()}.filter{$0.allSatisfy{$0.isLetter}}
    let arr2 = (0..<str2.count - 1).map{String(Array(str2)[$0...$0+1]).lowercased()}.filter{$0.allSatisfy{$0.isLetter}}

    return J(arr1, arr2)
}
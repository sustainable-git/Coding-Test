import Foundation

func solution(_ s:String) -> [Int] {
    let arr = s.components(separatedBy: "},").map{String($0).trimmingCharacters(in: ["{", "}"])}.sorted{$0.count < $1.count}
    var resultArr = [Int]()

    for i in arr {
        let map = i.split(separator: ",").map{String($0)}

        for j in map {
            if resultArr.contains(Int(j)!) { continue }
            else { resultArr.append(Int(j)!) }
        }
    }

    return resultArr
}

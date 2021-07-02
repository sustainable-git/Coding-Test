import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var resultArr = [Int]()
    
    for i in commands {
        var arr = Array(array[i[0]-1...i[1]-1])
        arr.sort()
        resultArr.append(arr[i[2]-1])
    }
    
    return resultArr
}

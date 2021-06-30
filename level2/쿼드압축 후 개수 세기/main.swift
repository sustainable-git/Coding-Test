import Foundation

var resultArr = [Int]()

func isAllEqual(_ arr : [[Int]]) -> Bool {
    for i in arr {
        for j in i {
            if j != arr[0][0] { return false }
        }
    }
    resultArr.append( arr[0][0] )
    return true
}

func DivideIntoFourArrays(of arr : [[Int]]) {
    if isAllEqual(arr) { return }

    let middleIndex = (arr.count + 1) / 2
    let lastIndex = arr.count

    let arr1 = arr[0..<middleIndex].map{Array($0[0..<middleIndex])}
    let arr2 = arr[0..<middleIndex].map{Array($0[middleIndex..<lastIndex])}
    let arr3 = arr[middleIndex..<lastIndex].map{Array($0[0..<middleIndex])}
    let arr4 = arr[middleIndex..<lastIndex].map{Array($0[middleIndex..<lastIndex])}

    if !isAllEqual(arr1) { DivideIntoFourArrays(of: arr1) }
    if !isAllEqual(arr2) { DivideIntoFourArrays(of: arr2) }
    if !isAllEqual(arr3) { DivideIntoFourArrays(of: arr3) }
    if !isAllEqual(arr4) { DivideIntoFourArrays(of: arr4) }
}

func solution(_ arr:[[Int]]) -> [Int] {
    if arr.count == 1 {
        if arr[0][0] == 0 { return [1, 0] }
        else { return [0, 1] }
    }
    DivideIntoFourArrays(of: arr)

    return [resultArr.filter{$0 == 0}.count, resultArr.filter{$0 == 1}.count]
}

func solution2(_ arr:[[Int]]) -> [Int] {
    var numOfZeros = 0
    var numOfOnes = 0
    
    func recur(_ x: Int, _ y: Int, _ n : Int) {
        let compare = arr[x][y]
        
        for i in x ..< x+n {
            for j in y ..< y+n {
                if compare != arr[i][j] {
                    recur(x, y, n/2)
                    recur(x, y+n/2, n/2)
                    recur(x+n/2, y, n/2)
                    recur(x+n/2, y+n/2, n/2)
                    return
                }
            }
        }
        if compare == 0 { numOfZeros += 1 }
        else { numOfOnes += 1 }
    }
    
    recur(0, 0, arr.count)
    
    return [numOfZeros, numOfOnes]
}

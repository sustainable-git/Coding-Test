import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var numStringArray = number.map{String($0)}
    var head = 0 // where to check
    var count = 0
    var numLocation = [Int]() // stack to find the last number
    
    while head < numStringArray.count && count < k { // to compare head and pastNumber && count should smaller than k
        if let lastNumberIndex = numLocation.last {
            if numStringArray[head] > numStringArray[lastNumberIndex] {
                numStringArray[lastNumberIndex] = "x"
                count += 1
                numLocation.removeLast()
            } else {
                numLocation.append(head)
                head += 1
            }
        } else { // if numLocation is empty, append location
            numLocation.append(head)
            head += 1
        }
    }
    
    numStringArray = numStringArray.filter{$0 != "x"} // eliminate "x"
    
    while count < k { // if the array is sorted by : >
        numStringArray.removeLast()
        count += 1
    }
    
    let result = numStringArray.joined()
    
    return Int(result) == 0 ? "0" : result
}

func solution2(_ number:String, _ k:Int) -> String {
    var numArr = [Character]()
    var count = 0
    
    for i in number {
        while numArr.last != nil && count < k {
            if numArr.last! < i {
                numArr.removeLast()
                count += 1
            } else { break }
        }
        numArr.append(i)
    }
    
    while count < k {
        numArr.removeLast()
        count += 1
    }
    
    let result = String(numArr)
    
    return Int(result) == 0 ? "0" : result
}

func solution(_ arr:[Int]) -> [Int] {
    if arr.count == 1 { return [-1] }

    var minValue = arr.first!
    for value in arr {
        if value < minValue { // if smaller
            minValue = value
        }
    }

    return arr.filter{$0 != minValue}
}

func solution2(_ arr:[Int]) -> [Int] {
    let min = arr.sorted().first!
    return arr.count == 1 ? [-1] : arr.compactMap{$0 == min ? nil : $0}
}
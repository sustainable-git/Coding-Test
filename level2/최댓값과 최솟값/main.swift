func solution(_ s:String) -> String {
    var intArr = s.split(separator: " ").map{Int(String($0))!}
    intArr.sort()

    return "\(intArr.first!) \(intArr.last!)"
}

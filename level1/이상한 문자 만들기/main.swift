func solution(_ s:String) -> String {
    var count = 0
    var arr = [String]()

    for i in s {
        if i == " " { count = 0; arr.append(" ") }
        else if count % 2 == 0 { count += 1; arr.append(i.uppercased()) }
        else { count += 1; arr.append(i.lowercased()) }
    }

    return arr.joined()
}

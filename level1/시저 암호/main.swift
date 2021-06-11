func solution(_ s:String, _ n:Int) -> String {
    var result = [String]()
    for character in s {
        var pushed = String(character)
        for _ in 1...n {
            if pushed == " " { break }
            else if pushed == "z" { pushed = "a" }
            else if pushed == "Z" { pushed = "A" }
            else { pushed = String(UnicodeScalar(UnicodeScalar(pushed)!.value+1)!) }
        }
        result.append(pushed)
    }

    return result.joined(separator: "")
}

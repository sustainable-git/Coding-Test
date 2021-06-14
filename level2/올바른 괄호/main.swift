import Foundation

func solution(_ s:String) -> Bool
{
    if s.first != "(" || s.last != ")" { return false }

    var a = 0 ; var b = 0
    for i in s {
        if i == "(" { a += 1 }
        else { b += 1}

        if a < b { return false }
    }

    return a == b ? true : false
}

import Foundation

func solution(_ s:String) -> Int{
    var array = [String]()
    
    for character in s {
        if array.last == String(character) {
            array.removeLast()
        } else {
            array.append(String(character))
        }
    }

    return array.count == 0 ? 1 : 0
}

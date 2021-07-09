import Foundation

func solution(_ s:String) -> Int {
    var result = ""
    var string = ""
    let letterNumDict = ["zero":"0", "one":"1", "two":"2", "three":"3", "four":"4", "five":"5", "six":"6", "seven":"7", "eight":"8", "nine":"9" ]

    for letter in s {
        if letter.isNumber { result += String(letter) }
        else { string += String(letter) }

        if let number = letterNumDict[string] {
            string = "" // delete
            result += number
        }
    }

    return Int(result)!
}

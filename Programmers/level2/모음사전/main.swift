import Foundation

let vowel: [String: Int] = ["A":0, "E":1, "I":2, "O":3, "U":4]
let offset: [Int] = [781, 156, 31, 6, 1]

func solution(_ word:String) -> Int {
    var result = 0
    let elements = word.map{ vowel[String($0)]! }
    for number in 0..<elements.count {
        result += offset[number] * elements[number]
    }

    return result + elements.count
}

// 각 번째 숫자 갯수 생각하면 될 듯?
// xxxx? 끝까지 갯수: 5 + 1 -> 6
// xxx?? 끝까지 갯수: 5 x 6 + 1 -> 31
// xx??? 끝까지 갯수: 5 x 31 + 1 -> 156
// x???? 끝까지 갯수: 5 x 156 + 1 -> 781

// 카운트 + 갯수
// EIO = 781 + 312 + 93


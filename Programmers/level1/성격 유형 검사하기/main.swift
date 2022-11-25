import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var barometer1: Int = 0
    var barometer2: Int = 0
    var barometer3: Int = 0
    var barometer4: Int = 0
    
    choices.enumerated().forEach { (index, value) in
        guard let characterType = survey[index].first else { return }
        switch value {
        case 1: addScore(-3, to: characterType)
        case 2: addScore(-2, to: characterType)
        case 3: addScore(-1, to: characterType)
        case 5: addScore(+1, to: characterType)
        case 6: addScore(+2, to: characterType)
        case 7: addScore(+3, to: characterType)
        default: return
        }
    }
    
    func addScore(_ score: Int, to characterType: Character) {
        switch characterType {
        case "R": barometer1 += score
        case "T": barometer1 -= score
        case "C": barometer2 += score
        case "F": barometer2 -= score
        case "J": barometer3 += score
        case "M": barometer3 -= score
        case "A": barometer4 += score
        case "N": barometer4 -= score
        default : return
        }
    }
    
    var result = String()
    result += barometer1 > 0 ? "T" : min("R", "T")
    result += barometer2 > 0 ? "F" : min("C", "F")
    result += barometer3 > 0 ? "M" : min("J", "M")
    result += barometer4 > 0 ? "N" : min("A", "N")
    
    return result
}

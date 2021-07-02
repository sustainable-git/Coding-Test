func solution(_ dartResult:String) -> Int {
    
    let numberList = dartResult.split{$0.isLetter||$0=="*"||$0=="#"}
    let letterList = dartResult.split{$0.isNumber}
    
    var totalScore = 0
    
    for(i,(number, letter)) in zip(numberList, letterList).enumerated() {
        var score = 0
        
        switch letter.first {
        case "S": score = Int(number)!; break
        case "D": score = Int(number)! * Int(number)!; break
        case "T": score = Int(number)! * Int(number)! * Int(number)!; break
        default: break
        }
        
        if letter.contains("*") {
            score *= 2
        } else if letter.contains("#") {
            score *= -1
        }
        
        if i < 2 { // to prevent "Index ouf of range"
            if letterList[i + 1].contains("*"){ score *= 2 }
        }
        
        totalScore += score
    }

    return totalScore
}

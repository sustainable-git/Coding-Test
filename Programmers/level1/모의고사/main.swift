import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let supo = [[1, 2, 3, 4, 5], [2, 1, 2, 3, 2, 4, 2, 5], [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    
    var resultArr = [Int]()
    
    for person in supo {
        var score = 0
        for (index, value) in answers.enumerated() {
            if value == person[index % person.count] {
                score += 1
            }
        }
        resultArr.append(score)
    }
    
    return [1,2,3].filter{resultArr[$0-1] == resultArr.max()}
}

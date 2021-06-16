import Foundation

func isPossible(_ skill : String, _ each_tree : String) -> Bool {
    var head = 0
    let skillArr = Array(skill)

    for i in each_tree {
        guard skill.contains(i) else { continue }

        if skillArr[head] == i { head += 1 }
        else { return false }
    }
    return true
}


func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var count = 0

    for i in skill_trees {
        if isPossible(skill, i) { count += 1 }
    }

    return count
}

func solution2(_ skill:String, _ skill_trees:[String]) -> Int {
    var count = 0    

    for i in skill_trees {
        if skill.starts(with: i.filter{skill.contains($0)}) {
            count += 1
        }
    }
    
    return count
}
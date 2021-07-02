import Foundation

func win(_ count : Int) -> Int {
    switch count {
    case 6 : return 1
    case 5 : return 2
    case 4 : return 3
    case 3 : return 4
    case 2 : return 5
    default : return 6
    }
}

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var count = 0
    var result = [Int]()
    
    for i in lottos {
        if win_nums.contains(i) {
            count += 1
        }
    }
    
    result.append(win(count))
    
    for i in lottos {
        if i == 0 {
            count += 1
        }
    }
    
    result.append(win(count))
    
    result.sort()
    
    return result
}

import Foundation

func location(_ n : String) -> [Double] {
    switch n {
    case "1" : return [1,4]
    case "2" : return [2,4]
    case "3" : return [3,4]
    case "4" : return [1,3]
    case "5" : return [2,3]
    case "6" : return [3,3]
    case "7" : return [1,2]
    case "8" : return [2,2]
    case "9" : return [3,2]
    case "*" : return [1,1]
    case "0" : return [2,1]
    case "#" : return [3,1]
    default : return [0,0]
    }
}

func distance(_ a : String, _ b : String) -> Int {
    let p1 = location(a) ; let p2 = location(b)
    return Int(abs(p1[0]-p2[0])+abs(p1[1]-p2[1]))
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = String()
    
    var leftHandPosition = "*"
    var rightHandPosition = "#"
    
    for i in numbers {
        switch i {
        case 1, 4, 7 :
            result.append("L")
            leftHandPosition = String(i)
            break
        case 3, 6, 9 :
            result.append("R")
            rightHandPosition = String(i)
            break
        default :
            if distance(String(i), leftHandPosition) < distance(String(i), rightHandPosition) { // 왼손이 가까운 경우
                leftHandPosition = String(i)
                result.append("L")
                break
            } else if distance(String(i), leftHandPosition) > distance(String(i), rightHandPosition) { // 오른손이 가까운 경우
                rightHandPosition = String(i)
                result.append("R")
                break
            } else { // 동일한 거리에 있는 경우
                switch hand {
                case "right" : // 오른손잡이
                    rightHandPosition = String(i)
                    result.append("R")
                    break
                case "left" : // 왼손잡이
                    leftHandPosition = String(i)
                    result.append("L")
                    break
                default:
                    break
                }
            }
        }
    }
    
    return result
}

let numbers = [0]
let hand = "right"
print(solution(numbers, hand))

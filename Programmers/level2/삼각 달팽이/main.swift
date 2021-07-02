import Foundation

func solution(_ n:Int) -> [Int] {
    var currentNum = 0
    var currentPosition = (-1, 0)
    let lastNum = n * (n + 1) / 2
    var direction = 0
    var count = 0
    var countMax = n
    var arr = [[Int]]()

    for i in 1...n { // arr initializer
        let iSizeArr = Array(repeating: 0, count: i)
        arr.append(iSizeArr)
    }

    while currentNum < lastNum {
        currentNum += 1
        count += 1

        switch direction % 3 {
            case 0 : // go down
                currentPosition.0 += 1
                arr[currentPosition.0][currentPosition.1] = currentNum
                break
            case 1 : // go right
                currentPosition.1 += 1
                arr[currentPosition.0][currentPosition.1] = currentNum
                break
            case 2 : // go left and go up
                currentPosition.0 -= 1
                currentPosition.1 -= 1
                arr[currentPosition.0][currentPosition.1] = currentNum
                break
            default : break
        }

        if count == countMax { // direct changing part
            count = 0
            countMax -= 1
            direction += 1
        }
    }

    return arr.reduce([]){$0 + $1}
}

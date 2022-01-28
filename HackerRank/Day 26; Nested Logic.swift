import Foundation

let firstInput = readLine()!.split(separator: " ").map{ Int(String($0))! } // return
let secondInput = readLine()!.split(separator: " ").map{ Int(String($0))! } // due

if firstInput[2] > secondInput[2] {
    print(10000)
} else if firstInput[2] == secondInput[2] {
    if firstInput[1] > secondInput[1] {
        print((firstInput[1] - secondInput[1]) * 500)
    } else if firstInput[1] == secondInput[1] {
        if firstInput[0] > secondInput[0] {
            print((firstInput[0] - secondInput[0]) * 15)
        } else {
            print(0)
        }
    } else {
        print(0)
    }
} else {
    print(0)
}

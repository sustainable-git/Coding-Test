import Foundation

func isInteger(_ number: Double) -> Bool {
    return number == Double(Int(number))
}

let firstInput = readLine()
let secondInput = readLine()
guard let firstInput = firstInput, let firstInputNumber = Int(firstInput),
      let secondInput = secondInput else {
    exit(-1)
}
let secondInputArray = secondInput.split(separator: " ").map { Int(String($0))! }

if firstInputNumber == 1 {
    print("A")
} else if firstInputNumber == 2 {
    if secondInputArray[0] != secondInputArray[1] {
        print("A")
    } else {
        print(secondInputArray[0])
    }
} else {
    let n1 = secondInputArray[0]
    let n2 = secondInputArray[1]
    let n3 = secondInputArray[2]
    if n2 == n1 {
        if secondInputArray.allSatisfy({ $0 == n1 }) {
            print(n1)
        } else {
            print("B")
        }
    } else {
        let A = Double(n3 - n2) / Double(n2 - n1)
        let B = Double(n2) - A * Double(n1)
        if isInteger(A) && isInteger(B) {
            let a = Int(A)
            let b = Int(B)
            var isOkay = true
            for index in 0..<secondInputArray.count - 1 {
                if secondInputArray[index + 1] == secondInputArray[index] * a + b {
                    continue
                } else {
                    print("B")
                    isOkay = false
                    break
                }
            }
            isOkay ? print(secondInputArray[secondInputArray.count - 1] * a + b) : Void()
        } else {
            print("B")
        }
    }
}

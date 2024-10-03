import Foundation

let input = readLine()
guard let numberString = input,
      let number = Int(numberString)
else {
    exit(-1)
}

let binaryNumberString = String(number, radix: 2)
print(binaryNumberString.filter{ $0 == "1" }.count)

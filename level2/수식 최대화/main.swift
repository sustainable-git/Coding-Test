import Foundation

func calculator(_ arr : [String], _ operatorArr : [String]) -> Int {
    var exp = arr
    for `operator` in operatorArr {
        while exp.contains(`operator`) {
            let index = exp.firstIndex(of: `operator`)!
            switch String(`operator`) {
            case "*" : exp[index-1] = String(Int(exp[index-1])! * Int(exp[index+1])!) ; break
            case "+" : exp[index-1] = String(Int(exp[index-1])! + Int(exp[index+1])!) ; break
            case "-" : exp[index-1] = String(Int(exp[index-1])! - Int(exp[index+1])!) ; break
            default : break
            }
            exp.remove(at: index)
            exp.remove(at: index)
        }
    }
    return Int(exp[0])!
}

func solution(_ expression:String) -> Int64 {
    let operatorArray = ["*", "+", "-"]
    var randomOperatorArray = [[String]]()
    var pickedCheck = Array<Bool>(repeating: false, count: operatorArray.count)

    func dfs(_ depth : Int, _ array : [String]){
        var currentArray = array
        if depth == operatorArray.count {
            randomOperatorArray.append(currentArray)
        } else {
            for i in 0..<operatorArray.count{
                guard pickedCheck[i] == false else { continue }
                pickedCheck[i] = true
                currentArray.append(operatorArray[i])
                dfs(depth + 1, currentArray)
                pickedCheck[i] = false
                currentArray.removeLast()
            }
        }
    }
    dfs(0, [])

    var splitedExpressionArray = [String]()
    var currentString = ""
    for i in expression {
        if operatorArray.contains(String(i)) {
            splitedExpressionArray += [currentString, String(i)]
            currentString = ""
        } else { currentString += String(i) }
    }
    splitedExpressionArray.append(currentString)

    var resultArray = [Int]()
    for operatorArray in randomOperatorArray {
        resultArray.append(calculator(splitedExpressionArray, operatorArray))
    }
    let minAbs = abs(resultArray.min()!)
    let maxAbs = abs(resultArray.max()!)

    return minAbs > maxAbs ? Int64(minAbs) : Int64(maxAbs)
}

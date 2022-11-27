import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tangerineSizeDictionary = Dictionary<Int, Int>()
    tangerine.forEach { size in
        tangerineSizeDictionary[size, default: 0] += 1
    }
    var numberOfLeftTangerineToPutInABox = k
    var minValueOfDifferentKinds = 0
    tangerineSizeDictionary.sorted {
        $0.value > $1.value
    }.enumerated().forEach { index, dictionary in
        if numberOfLeftTangerineToPutInABox > 0 {
            minValueOfDifferentKinds += 1
            numberOfLeftTangerineToPutInABox -= dictionary.value
        }
    }

    return minValueOfDifferentKinds
}

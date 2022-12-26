import Foundation
import Glibc

public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    var adenine: [Int] = Array(repeating: 0, count: S.count + 1)
    var cytosine: [Int] = Array(repeating: 0, count: S.count + 1)
    var guanine: [Int] = Array(repeating: 0, count: S.count + 1)
    S.enumerated().forEach { index, nucleotide in
        switch nucleotide {
        case "A":
            adenine[index+1] = adenine[index] + 1
            cytosine[index+1] = cytosine[index]
            guanine[index+1] = guanine[index]
        case "C":
            adenine[index+1] = adenine[index]
            cytosine[index+1] = cytosine[index] + 1
            guanine[index+1] = guanine[index]
        case "G":
            adenine[index+1] = adenine[index]
            cytosine[index+1] = cytosine[index]
            guanine[index+1] = guanine[index] + 1
        default:
            adenine[index+1] = adenine[index]
            cytosine[index+1] = cytosine[index]
            guanine[index+1] = guanine[index]
        }
    }
    return zip(P, Q).map { startIndex, endIndex in
        if adenine[endIndex + 1] > adenine[startIndex] { return 1 }
        if cytosine[endIndex + 1] > cytosine[startIndex] { return 2 }
        if guanine[endIndex + 1] > guanine[startIndex] { return 3 }
        return 4
    }
}

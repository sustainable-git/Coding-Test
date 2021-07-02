import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var dict = [Int : Double]()

    for stage in 1...stages.max()! {
        if stage > N { continue } // if all cleared

        var played = 0.0 // denominator
        var succeeded = 0.0 // numerator
        for comparison in stages {
            if stage == comparison { played += 1 }
            else if stage < comparison { played += 1 ; succeeded += 1 }
        }

        dict.updateValue(Double(1 - succeeded/played), forKey: stage)
    }

    while dict.count < N { // if there is a stage no one cleared
        dict.updateValue(0, forKey: dict.keys.max()!+1)
    }

    let result = dict.sorted{
            if $0.1 == $1.1 {
                if $0.0 < $1.0 { return true }
                else {return false } }
            else { return $0.1 > $1.1 } }.map { $0.key }

    return result
}

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    let a = A.sorted(by : >)
    let b = B.sorted(by : <)

    return zip(a, b).reduce(0){ $0 + $1.0 * $1.1 }
}

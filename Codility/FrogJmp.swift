import Foundation
import Glibc

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    return Int(ceil(Double(Y - X) / Double(D)))
}

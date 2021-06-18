import Foundation

func gcd(_ a : Int, _ b : Int) -> Int {
    let mod = a % b
    return mod == 0 ? b : gcd(b, mod)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    let total = w * h
    let divisor = gcd(w, h)

    if divisor == 1 {
        return Int64(total) - Int64(w + h - 1)
    } else {
        let minus = ((w / divisor) + (h / divisor) - 1) * divisor
        return Int64(total) - Int64(minus)
    }
}

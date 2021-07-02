```
func gcd(_ a: Int, _ b: Int) -> Int {
    let mod = a % b
    return mod == 0 ? b : gcd(b, mod)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
```

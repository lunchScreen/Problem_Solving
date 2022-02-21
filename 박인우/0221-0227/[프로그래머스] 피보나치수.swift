func solution(_ n:Int) -> Int {
    var d: [Int] = Array(repeating: 0, count: n+1)
    d[1] = 1
    for i in 2...n {
        d[i] = (d[i-1] + d[i-2]) % 1234567
    }
    return d[n] % 1234567
}

// 1052
import Foundation

@inline(__always)
func getExponent(_ n: Int) -> Int {
    var count: Int = 0, num: Int = 1
    while num <= n {
        count += 1
        num *= 2
    }
    return count - 1
}

@inline(__always)
func getExponents(_ n: Int) -> [Int] {
    var n: Int = n
    var exponents: [Int] = []
    while n > 1 {
        exponents.append(getExponent(n))
        n -= (1 << exponents.last!)
    }
    return n == 1 ? exponents + [0] : exponents
}

@inline(__always)
func getMinBottle(exponents: [Int], k: Int) -> Int {
    var exponents: [Int] = exponents
    var minBottle: Int = 0
    while k < exponents.count {
        minBottle += ((1 << exponents[exponents.count - 2]) - (1 << exponents.last!))
        exponents.insert(exponents[exponents.count - 2] + 1, at: exponents.count - 2)
        exponents.removeLast(); exponents.removeLast();
    }
    return minBottle
}

@inline(__always)
func solution(n: Int, k: Int) {
    print(getMinBottle(exponents: getExponents(n), k: k))
}

let nk: [Int] = readLine()!.components(separatedBy: " ").map({ Int($0)! })
solution(n: nk[0], k: nk[1])

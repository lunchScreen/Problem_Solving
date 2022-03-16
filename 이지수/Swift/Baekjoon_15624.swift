import Foundation
func fibo(_ n: Int) -> Int {
    guard n > 1 else { return n == 1 ? 1 : 0 } 
    var a: Int = 0
    var b: Int = 1
    for _ in 0..<(n-1) {
        let temp = b
        b = (a+b) % 1000000007
        a = temp
    }
    return b
}
print(fibo(Int(readLine()!)!))

import Foundation
func solution(_ n:Int64) -> Int64 {
    let number = Int64(sqrt(Double(n)))
    return number * number == n ? (number + 1) * (number + 1) : -1
}

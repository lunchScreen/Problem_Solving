import Foundation

func solution(_ s:String) -> [Int] {
    var ss = s
    var count = 0
    var zero = 0
    while ss != "1" {
        var tempCount = 0
        for str in ss.map { String($0) } {
            if str == "0" {
                zero += 1
            } else {
                tempCount += 1
            }
        }
        ss = String(tempCount, radix: 2)
        count += 1
    }    
    return [count, zero]
}

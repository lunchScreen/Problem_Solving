import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    var i = Double(String(n, radix: 3).count) - 1
    for c in String(n, radix: 3).reversed() {
        answer += Int(String(c))! * Int(pow(3.0, i))
        i -= 1
    }
    return answer
}

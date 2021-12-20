import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer: Int = 0
    
    for x in 0..<a.count {
        answer += a[x] * b[x]
    }
    return answer
}

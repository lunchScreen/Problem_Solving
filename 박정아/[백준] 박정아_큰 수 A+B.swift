import Foundation

func solution() {
    let input = (readLine()!).components(separatedBy: " ")
    let a = Array(input[0]).reversed().map{ Int(String($0))! }
    let b = Array(input[1]).reversed().map{ Int(String($0))! }
    let countA = a.count
    let countB = b.count
    let maxValue = max(countA, countB)
    let minValue = min(countA, countB)
    var answer = Array(repeating: 0, count: maxValue)
    
    for i in 0..<maxValue {
        if i < minValue {
            answer[i] += a[i] + b[i]
        } else if countA == maxValue {
            answer[i] += a[i]
        } else {
            answer[i] += b[i]
        }
        if 10 <= answer[i] {
            let quotient = answer[i] / 10
            answer[i] -= quotient * 10
            if i == maxValue - 1 {
                answer.append(quotient)
                continue
            }
            answer[i + 1] = quotient
        }
    }
    
    print(answer.map{ String($0) }.reversed().joined())
}

solution()


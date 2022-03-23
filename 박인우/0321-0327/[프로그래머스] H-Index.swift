import Foundation

func solution(_ citations:[Int]) -> Int {
    for (i, n) in citations.sorted(by: >).enumerated() {
        if i+1 > n {
            return i
        }
    }
    return citations.count
}

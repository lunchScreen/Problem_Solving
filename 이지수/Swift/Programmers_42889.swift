import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var levels: [Int] = [Int](repeating: 0, count: N + 1)
    for stage in stages {
        levels[stage-1] += 1
    }
    var failure: [Double] = []
    var n = levels.reduce(0) {$0 + $1}
    levels.removeLast()
    for count in levels {
        failure.append(Double(count)/Double(n))
        n -= count
    }
    return failure.enumerated().sorted() {
        if $0.1 > $1.1 { return true }
        else { return $0.0 < $1.0 }
    }.map{$0.0 + 1}
}

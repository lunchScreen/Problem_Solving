import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var needs = d.sorted()
    var idx = 0
    while idx < needs.count {
        if needs[0...idx].reduce(0, +) <= budget {
            idx += 1
        } else {
            break
        }
    }
    return idx
}

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return zip(absolutes, signs).map {
        if $1 {
            return $0
        } else {
            return -$0
        }
    }.reduce(0, +)
}

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a,b).map {
        $0 * $1
    }.reduce(0, +)
}

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var sortedA = A.sorted(by: <)
    var sortedB = B.sorted(by: >)
    
    return (0..<A.count).reduce(0, {
        return $0 + (sortedA[$1] * sortedB[$1])
    })
}

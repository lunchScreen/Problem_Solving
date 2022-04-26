import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 1...n {
        var x = i-1
        var y = i-1
        (0...x).forEach { arr[$0][y] = i }
        (0...y).forEach { arr[x][$0] = i }
    }
    
    let result = arr.reduce([], +)
    
    return Array(result[Int(left)...Int(right)])
}

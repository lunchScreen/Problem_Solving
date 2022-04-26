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

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var result = [Int]()
    
    for index in Int(left)+1...Int(right)+1 {
        var number = max(index / n + 1,index % n)
        if index % n == 0 {
            number = n
        }
        result.append(number)
    }
    
    return result
}

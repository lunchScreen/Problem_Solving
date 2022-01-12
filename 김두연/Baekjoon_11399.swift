import Foundation

func baekjoon11399() -> Int {
    var n: Int = Int(readLine()!)!
    var p: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    p.sort()

    var result: Int = 0

    for (index, value) in p.enumerated() {
        result += (value * (n - index))
    }
    
    return result
}

//print(baekjoon11399())

import Foundation

func baekjoon11047() -> Int {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n: Int = temp[0]
    var k = temp[1]

    var a = [Int]()

    for _ in 0..<n {
        a.append(Int(readLine()!)!)
    }

    var result: Int = 0

    for coin in a.reversed() {
        if k == 0 {
            break
        }
        
        result += k / coin
        k %= coin
    }
    
    return result
}


//print(baekjoon11047())

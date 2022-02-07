import Foundation

func baekjoon2143(t: Int) {
    let n = Int(readLine()!)!
    let a = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = Int(readLine()!)!
    let b = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var sumA: [Int: Int] = [:]
    var sumB: [Int: Int] = [:]
    
    for i in 0..<n {
        var sum = a[i]
        if sumA[sum] == nil {
            sumA[sum] = 1
        } else {
            sumA[sum] = sumA[sum]! + 1
        }
        for j in i+1..<n {
            sum += a[j]
            if sumA[sum] == nil {
                sumA[sum] = 1
            } else {
                sumA[sum] = sumA[sum]! + 1
            }
        }
    }
    
    for i in 0..<m {
        var sum = b[i]
        if sumB[sum] == nil {
            sumB[sum] = 1
        } else {
            sumB[sum] = sumB[sum]! + 1
        }
        for j in i+1..<m {
            sum += b[j]
            if sumB[sum] == nil {
                sumB[sum] = 1
            } else {
                sumB[sum] = sumB[sum]! + 1
            }
        }
    }
    
    var answer = 0
    
    sumA.keys.forEach {
        if sumB[t-$0] != nil {
            answer += sumA[$0]! * sumB[t-$0]!
        }
    }
    
    print(answer)
}

let t = Int(readLine()!)!
//baekjoon2143(t: t)

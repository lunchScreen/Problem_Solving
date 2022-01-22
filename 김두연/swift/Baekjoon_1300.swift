import Foundation

func baekjoon1300() -> Int {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    
    var left = 1
    var right = k
    
    while left <= right {
        let mid = (left + right) / 2
        var sum = 0
        
        for i in 1...n {
            sum += min(n, mid / i)
        }
        
        if sum >= k {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return left
}

//print(baekjoon1300())

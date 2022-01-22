import Foundation

func baekjoon2110(_ n: Int, _ c: Int) -> Int {
    var arr = [Int]()
    
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    arr.sort()
    
    var left = 1
    var right = arr.last! - arr.first!
    
    func isPossible(dist: Int) -> Bool {
        var count = 1
        var prev = 0
        
        for i in 1..<arr.count {
            if arr[i] - arr[prev] >= dist {
                count += 1
                prev = i
            }
        }
        
        return count >= c
    }
    
    var result = 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if isPossible(dist: mid) {
            result = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
        
    }
    
    return result
}

//let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
//let n = temp[0]
//let c = temp[1]

//print(baekjoon2110(n, c))

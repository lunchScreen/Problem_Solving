import Foundation

func baekjoon7453() {
    let n = Int(readLine()!)!
    
    var a = [Int64]()
    var b = [Int64]()
    var c = [Int64]()
    var d = [Int64]()
    
    for _ in 0..<n {
        let temp = readLine()!.split(separator: " ").map { Int64(String($0))! }
        a.append(temp[0])
        b.append(temp[1])
        c.append(temp[2])
        d.append(temp[3])
    }
    
    var sumAB = [Int64]()
    var sumCD = [Int64]()
    
    for i in 0..<n {
        for j in 0..<n {
            sumAB.append(a[i] + b[j])
            sumCD.append(c[i] + d[j])
        }
    }
    
    sumAB.sort()
    sumCD.sort()
    
    var result: Int64 = 0
    var left = 0
    var right = sumAB.count - 1
    
    while left < sumAB.count && right >= 0 {
        let sum = sumAB[left] + sumCD[right]
        
        if sum == 0 {
            var xCount: Int64 = 0
            var yCount: Int64 = 0
            let x = sumAB[left], y = sumCD[right]
            
            while sumCD[right] == y {
                yCount += 1
                right -= 1
                if right == -1 { break }
            }
            
            while sumAB[left] == x {
                xCount += 1
                left += 1
                if left == sumAB.count { break }
            }
            
            result += xCount * yCount
            
        } else if sum < 0 {
            left += 1
        } else {
            right -= 1
        }
    }
    
    print(result)
    
}

//baekjoon7453()

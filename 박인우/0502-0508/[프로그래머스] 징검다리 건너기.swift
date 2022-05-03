import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var stones = stones
    var answer = 0
    
    while true {
        var i = 0
        var complete = true
        while i < stones.count {
            if stones[i] > 0 {
                stones[i] -= 1
                i += 1
            } else {
                var jump = 1
                while i + jump < stones.count && stones[i + jump] == 0 {
                    jump += 1
                }
                i += jump
                if 1 + jump > k {
                    complete = false
                    break
                }
            }
        }
        
        if complete { answer += 1} else { break }
    }
    
    return answer
}

func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 1
    var end = 2000000
    var answer = 0
    
    while start < end {
        var zero = 0
        var possible = true
        let mid = (start+end) / 2
        
        for stone in stones {
            if stone < mid {
                zero += 1
            } else {
                zero = 0
            }
            
            if zero >= k {
                possible = false
                break
            }
        }
        
        if possible {
            start = mid + 1
            answer = mid
        } else {
            end = mid
        }
    }
    
    return answer
}

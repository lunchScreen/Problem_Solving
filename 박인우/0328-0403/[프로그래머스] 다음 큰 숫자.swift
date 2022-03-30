import Foundation

func solution(_ n:Int) -> Int
{
    var now = n
    let binary = String(n, radix: 2)
    let oneCount = binary.reduce(0, {
        if $1 == "1" {
            return $0 + 1
        } else {
            return $0
        }
    })
    
    while true {
        now += 1
        let nowBinary = String(now, radix: 2)
        let nowOneCount = nowBinary.reduce(0, {
            if $1 == "1" {
                return $0 + 1
            } else {
                return $0
            }
        })
        
        if nowOneCount == oneCount {
            return now
        }
    }
    
    return -1
}

// 효율성 탈락

import Foundation

func solution(_ n:Int) -> Int
{
    var now = n
    
    while true {
        now += 1
        if now.nonzeroBitCount == n.nonzeroBitCount {
            return now
        }
    }
    
    return -1
}
